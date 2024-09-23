{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    ags.url = "github:Aylur/ags";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    lix-module,
    stylix,
    home-manager,
    ...
  } @ inputs: let
    username = "beans";
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    specialArgs = {
      inherit inputs username;
    };
  in {
    nixosConfigurations = {
      nixos-beans = nixpkgs.lib.nixosSystem {
        inherit specialArgs system;
        modules = [
          ./nixos/configuration.nix
          lix-module.nixosModules.default
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = specialArgs;
            home-manager.backupFileExtension = "old";
            home-manager.users.${username} = import ./home-manager/home.nix;
          }
        ];
      };
    };
  };
}
