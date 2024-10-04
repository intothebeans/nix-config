{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
{
  options = {
    desktop.enable = lib.mkEnableOption "Enable desktop environment.";
  };
  config = lib.mkIf config.desktop.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    environment.systemPackages = with pkgs; [
      sushi
      eog
    ];

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
      nautilus
    ];
    services.udev.packages = with pkgs; [ gnome-settings-daemon ];

    nixpkgs.overlays = [
      # GNOME 46: triple-buffering-v4-46
      (final: prev: {
        gnome = prev.gnome.overrideScope (
          gnomeFinal: gnomePrev: {
            mutter = gnomePrev.mutter.overrideAttrs (old: {
              src = pkgs.fetchFromGitLab {
                domain = "gitlab.gnome.org";
                owner = "vanvugt";
                repo = "mutter";
                rev = "triple-buffering-v4-46";
                hash = "sha256-fkPjB/5DPBX06t7yj0Rb3UEuu5b9mu3aS+jhH18+lpI=";
              };
            });
          }
        );
      })
    ];

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
      image = ./forest-river.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
      cursor = {
        package = pkgs.capitaine-cursors;
        name = "capitaine-cursors";
        size = 20;
      };
      fonts = with pkgs; {
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
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
  };
}
