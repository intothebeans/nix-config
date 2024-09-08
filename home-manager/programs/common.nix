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
    xfce.thunar
    xfce.catfish
    zathura

    # office
    ticktick
    onlyoffice-bin
    obsidian
  ];
  programs = {
    btop.enable = true;
  };
}
