{
  pkgs,
  config,
  ...
}: {
  home.programs = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utilities
    fastfetch
    ripgrep
    xclip
    xdg-utils
    kdePackages.xdg-desktop-portal-kde

    # libraries
    glib
    glibc
    libnotify

    # network
    protonvpn-gui

    # files
    veracrypt
    nextcloud-client
    qbittorrent-enhanced
    kdePackages.dolphin

    # office
    ticktick
    onlyoffice-bin
    obsidian
  ];
  programs = {
    btop.enable = true;
    flatpak.enable = true;
  };
  xdg.enable = true;
}
