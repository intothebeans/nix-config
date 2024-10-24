{
  description = "NixOS configuration";
  nixConfig = {
    extra-substituers = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix/ed91a20c84a80a525780dcb5ea3387dddf6cd2de";

    agenix.url = "github:ryantm/agenix";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    deploy-rs.url = "github:serokell/deploy-rs";
  };

  outputs =
    {
      self,
      nixpkgs,
      stylix,
      home-manager,
      agenix,
      nixos-hardware,
      deploy-rs,
      ...
    }@inputs:
    let
      server-system = "aarch64-linux";
      laptop-system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos-beans =
          let
            username = "beans";
            specialArgs = {
              inherit inputs username;
            };
            system = laptop-system;
            pkgs = nixpkgs.legacyPackages.${system};
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs system;
            modules = [
              ./hosts/laptop/configuration.nix
              ./users/${username}/nixos.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = specialArgs;
                home-manager.backupFileExtension = "old";
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }
            ];
          };
        pi4 =
          let
            username = "admin";
            specialArgs = {
              inherit inputs username;
            };
            system = server-system;
            pkgs = nixpkgs.legacyPackages.${system};
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs system;
            modules = [
              ./hosts/pi4/configuration.nix
              ./users/${username}/nixos.nix
              home-manager.nixosModules.home-manager
              {
                home-manager.useGlobalPkgs = true;
                home-manager.useUserPackages = true;
                home-manager.extraSpecialArgs = specialArgs;
                home-manager.backupFileExtension = "old";
                home-manager.users.${username} = import ./users/${username}/home.nix;
              }

            ];
          };
      };
      deploy.nodes.server =
        let
          system = server-system;
          pkgs = import nixpkgs { inherit system; };
          # nixpkgs with deploy-rs overlay but force the nixpkgs package
          deployPkgs = import nixpkgs {
            inherit system;
            overlays = [
              deploy-rs.overlay # or deploy-rs.overlays.default
              (self: super: {
                deploy-rs = {
                  inherit (pkgs) deploy-rs;
                  lib = super.deploy-rs.lib;
                };
              })
            ];
          };
        in
        {
          hostname = "192.168.1.200";
          profiles.system = {
            sshOpts = [ "-A" ];
            fastConnection = true;
            interactiveSudo = true;
            sshUser = "admin";
            path = deployPkgs.deploy-rs.lib.activate.nixos self.nixosConfigurations.pi4;
            user = "root";
          };
        };
      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
