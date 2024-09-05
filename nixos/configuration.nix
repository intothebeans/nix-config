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
    inputs.home-manager.nixosModules.default
  ];

  # bootloader
  boot.plymouth.enable = true;
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
    ];
    shell = pkgs.zsh;
  };

  security.sudo.extraConfig = ''
    Defaults:${username} !authenticate
  '';
  nix.settings.trusted-users = [username];

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
    };
  };

  # time zone
  time.timeZone = "America/New_York";

  # select internationalization properties
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # graphics
  services.xserver.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # enable plasma
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "eucalyptus-drop";
  services.desktopManager.plasma6.enable = true;

  # fonts
  fonts = {
    packages = with pkgs; [
      material-design-icons
      font-awesome
      noto-fonts
      noto-fonts-emoji

      # nerd fonts
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "ComicShannsMono"
          "CascadiaCode"
        ];
      })
    ];
    enableDefaultPackages = false;
  };

  # themeing
  stylix = {
    enable = true;
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };
    image = ./wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
    };
    fonts = with pkgs; {
      monospace = {
        name = "JetBrainsMono Nerd Font";
        package = nerdfonts.override {fonts = ["JetBrainsMono"];};
      };
      sansSerif = {
        name = "Noto Sans";
        package = noto-fonts;
      };
      serif = {
        name = "Noto Serif";
        package = noto-fonts;
      };
    };
    targets.grub.enable = lib.mkDefault false;
  };

  # configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
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

  # enable swap partition
  swapDevices = [{device = "/dev/nvme0n1p6";}];

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # allow dynamic binaries
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = [];

  # system packages
  environment.systemPackages = with pkgs; let
    themes = callPackage ./sddm-theme.nix {};
  in [
    vim
    kitty
    firefox
    git
    wget
    curl
    themes.eucalyptus-drop
  ];

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
