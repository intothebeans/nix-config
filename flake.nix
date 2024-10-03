{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      lix-module,
      stylix,
      home-manager,
      sops-nix,
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
              stylix.nixosModules.stylix
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
              ./users/${username}/nixos.nix
              ./hosts/pi4/configuration.nix
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
