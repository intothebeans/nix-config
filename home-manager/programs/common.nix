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
    blueman
    libnotify
    brightnessctl
    bat
    jq
    coreutils-full
    killall

    # network
    protonvpn-gui
    networkmanagerapplet

    # files
    veracrypt
    nextcloud-client
    qbittorrent-enhanced
    zathura
    xfce.thunar
    xfce.catfish

    # office
    ticktick
    zotero
    onlyoffice-bin
    obsidian
  ];
  programs = {
    btop.enable = true;
  };
}
