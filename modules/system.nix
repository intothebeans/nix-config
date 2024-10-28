{
  pkgs,
  lib,
  config,
  username,
  ...
}:
{
  # security
  # security.sudo.extraConfig = ''
  #  Defaults:${username} !authenticate
  #'';
  security.polkit.enable = true;
  services.gnome = {
    gnome-keyring.enable = true;
  };
  security.pam.services.login.enableGnomeKeyring = true;

  # enable experimental features (from https://github.com/Misterio77/nix-starter-configs/blob/main/minimal/nixos/configuration.nix)
  nix.settings = {
    experimental-features = "nix-command flakes";
    # Workaround for https://github.com/NixOS/nix/issues/9574
    nix-path = config.nix.nixPath;
    builders-use-substitutes = true;
    trusted-users = [ "${username}" ];
    substituters = [
      "https://nix-community.cachix.org"
      "https://cache.nixos.org"
    ];
    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  # garbage collection
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "daily";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow dynamic binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    webkitgtk
  ];

  # system packages 
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
  ];
}
