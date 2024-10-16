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
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/modules.nix
  ];

  desktop.enable = true;
  filesystem.laptop.enable = true;
  nvidia.enable = true;
  sshConfig.enable = true;
  docker.enable = true;
  vm.enable = true;

  # bootloader
  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];
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

  networking = {
    hostName = "nixos-beans";
    networkmanager.enable = true;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22
        12470
      ];
      allowedUDPPorts = [
        22
        12470
      ];
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

  # app images
  programs.appimage.binfmt = true;

  # power
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  # system packages
  environment.systemPackages = with pkgs; [
    firefox
    kitty
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;
  services.flatpak.enable = true;

  # system installation required for browser and polkit integration
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ username ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
