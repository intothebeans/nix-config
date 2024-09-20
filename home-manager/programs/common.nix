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
    networkmanagerapplet

    # security
    protonvpn-gui

    # files
    veracrypt
    nextcloud-client
    qbittorrent-enhanced
    kdePackages.okular
    nautilus
    appimage-run
    sshfs

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
