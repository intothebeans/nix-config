{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # files -----------------------------------------
    appimage-run
    gparted
    nemo-with-extensions
    nextcloud-client
    p7zip
    qbittorrent-enhanced
    sshfs
    unzip
    zip

    # utilities --------------------------------------
    auto-cpufreq
    bat
    coreutils-full
    dialog
    fd
    freerdp3
    iproute2
    libnotify
    netcat-gnu
    nix-index
    ripgrep
    safeeyes
    trash-cli

    # security ---------------------------------------
    protonvpn-gui
    veracrypt

    # office -----------------------------------------
    obsidian
    onlyoffice-bin
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

    # audio
    spicetify-cli

    # development -------------------------------------
    # editors
    emacs
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
