{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }@inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        nixos-beans = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          system = "x86_64-linux";
          modules = [
            ./nixos/configuration.nix
            inputs.home-manager.nixosModules.default
          ];
        };
      };
    };
}
