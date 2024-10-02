# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  lib,
  config,
  pkgs,
  inputs,
  username,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./modules/default.nix
  ];

  # bootloader
  boot.plymouth.enable = true;
  boot.extraModprobeConfig = ''blacklist nouveau options nouveau modeset=0 options nvidia_drm fbdev=1'';
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      device = "nodev";
      enable = true;
      efiSupport = true;
      theme = ./grub-theme;
      useOSProber = true;
    };
  };

  # users
  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "Aiden";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirt"
      "sshuser"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlBs5J+/fm3x4xOClnOMLmOqoz5Qz/SCS6fF/ggzJP2"
    ];
  };

  # security
  security.sudo.extraConfig = ''
    Defaults:${username} !authenticate
  '';
  nix.settings.trusted-users = [username];
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
    hostName = "nixos-beans";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [22];
      allowedUDPPorts = [22];
    };
  };

  # enable CUPS to print documents
  services.printing.enable = true;

  # enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow dynamic binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
  ];

  # app images
  programs.appimage.binfmt = true;

  # power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # system packages
  environment.systemPackages = with pkgs; [
    vim
    kitty
    firefox
    git
    wget
    curl
  ];
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  services.flatpak.enable = true;

  # system installation required for browser and polkit integration
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [username];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
