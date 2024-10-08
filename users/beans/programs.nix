{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # files -----------------------------------------
    appimage-run
    nemo-with-extensions
    seafile-client
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
