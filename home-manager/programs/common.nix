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
    base16-schemes
    brightnessctl
    bat

    # network
    protonvpn-gui
    networkmanagerapplet

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
}
