{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    stylix.url = "github:danth/stylix";

    hyprland.url = "github:hyprwm/Hyprland";

    winapps.url = "github:winapps-org/winapps/feat-nix-packaging";
    winapps.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    winapps,
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
          inputs.stylix.nixosModules.stylix
          ({pkgs, ...}: {
            environment.systemPackages = [
              winapps.packages.${system}.winapps
              winapps.packages.${system}.winapps-launcher
            ];
          })
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
