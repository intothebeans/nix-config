{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # archives
    zip
    unzip
    p7zip

    # utilities
    fastfetch
    flatpak
    ripgrep
    xdg-utils
    kdePackages.xdg-desktop-portal-kde

    # libraries
    libnotify
    base16-schemes

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
  };
  xdg.enable = true;
}
