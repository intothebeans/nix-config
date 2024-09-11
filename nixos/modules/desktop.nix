{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  programs.dconf.enable = true;

  # hyprland
  programs.hyprland.enable = true;
  #programs.hyprland.package = inputs.hyprland.packages."${pkgs.system}".hyprland;

  # enable plasma
  services.displayManager.sddm = {
    enable = true;
    theme = "eucalyptus-drop";
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
    extraPackages = with pkgs; [
      kdePackages.qt5compat
    ];
  };

  #services.desktopManager.plasma6.enable = true;
  # environment.plasma6.excludePackages = with pkgs.kdePackages; [
  #   konsole
  #   plasma-browser-integration
  #   elisa
  #   khelpcenter
  #   spectacle
  #   krdp
  # ];

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
