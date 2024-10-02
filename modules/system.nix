{
  pkgs,
  lib,
  config,
  username,
  ...
}:
{
  # security
  security.sudo.extraConfig = ''
    Defaults:${username} !authenticate
  '';
  nix.settings.trusted-users = [ username ];
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
  };

  # garbage collection
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # networking
  networking = {
    networkmanager.enable = true;
  };

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow dynamic binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries =
    with pkgs;
    [
    ];

  # system packages 
  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
  ];
}
