{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # files -----------------------------------------
    nemo-with-extensions
    nextcloud-client
    p7zip
    qbittorrent-enhanced
    spacedrive
    sshfs
    unzip
    zip

    # utilities --------------------------------------
    bat
    coreutils-full
    dialog
    fastfetch
    freerdp3
    iproute2
    libnotify
    netcat-gnu
    nix-index
    ripgrep
    trashy

    # security ---------------------------------------
    protonvpn-gui
    veracrypt

    # office -----------------------------------------
    obsidian
    onlyoffice-bin
    ticktick
    zotero

    # imaages ------------------------------------------
    gimp
    imagemagick
    inkscape
    viu

    # video -------------------------------------------   
    celluloid
    ffmpeg
    obs-studio
    davinci-resolve

    # development -------------------------------------
    # editors
    neovim
    vscode

    # nix
    nil
    nixfmt-rfc-style

    # js
    jq
    nodejs

    # c
    gcc

    # rust
    rustup

    # python
    python3

    # tools
    github-desktop
    just

    # games -------------------------------------------
    lutris
    mangohud
    protonup
    vesktop
    wine
    winetricks
  ];
  programs = {
    btop.enable = true;
  };
}
