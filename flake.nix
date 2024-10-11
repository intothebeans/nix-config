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

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
    raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      lix-module,
      stylix,
      home-manager,
      sops-nix,
      raspberry-pi-nix,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        nixos-beans =
          let
            username = "beans";
            specialArgs = {
              inherit inputs username;
            };
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
          in
          nixpkgs.lib.nixosSystem {
            inherit specialArgs system;
            modules = [
              ./hosts/laptop/configuration.nix
              ./users/${username}/nixos.nix
              lix-module.nixosModules.default
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
            system = "aarch64-linux";
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
    };
}
