{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    atomix
    cheese
    epiphany
    geary
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-connections
    gnome-console
    gnome-contacts
    gnome-logs
    gnome-maps
    gnome-music
    gnome-photos
    gnome-system-monitor
    gnome-terminal
    gnome-tour
    hitori
    iagno
    loupe
    tali
    totem
  ];
  services.udev.packages = with pkgs; [gnome-settings-daemon];
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
          "ComicShannsMono"
          "CascadiaCode"
          "CodeNewRoman"
          "MartianMono"
        ];
      })
    ];
  };

  # themeing
  stylix = {
    enable = true;
    homeManagerIntegration = {
      autoImport = true;
      followSystem = true;
    };
    image = ../forest-river.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors";
      size = 20;
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
      emoji = {
        name = "Noto Color Emoji";
        package = noto-fonts-emoji;
      };
    };
    targets.grub.enable = lib.mkDefault false;
  };
}
