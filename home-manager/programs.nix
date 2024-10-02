{pkgs, ...}: {
  home.packages = with pkgs; [
    # ███████╗██╗██╗     ███████╗███████╗
    # ██╔════╝██║██║     ██╔════╝██╔════╝
    # █████╗  ██║██║     █████╗  ███████╗
    # ██╔══╝  ██║██║     ██╔══╝  ╚════██║
    # ██║     ██║███████╗███████╗███████║
    # ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

    appimage-run
    libappimage
    nextcloud-client
    p7zip
    qbittorrent-enhanced
    sshfs
    unzip
    zip

    # ██╗   ██╗████████╗██╗██╗     ██╗████████╗██╗███████╗███████╗
    # ██║   ██║╚══██╔══╝██║██║     ██║╚══██╔══╝██║██╔════╝██╔════╝
    # ██║   ██║   ██║   ██║██║     ██║   ██║   ██║█████╗  ███████╗
    # ██║   ██║   ██║   ██║██║     ██║   ██║   ██║██╔══╝  ╚════██║
    # ╚██████╔╝   ██║   ██║███████╗██║   ██║   ██║███████╗███████║
    #  ╚═════╝    ╚═╝   ╚═╝╚══════╝╚═╝   ╚═╝   ╚═╝╚══════╝╚══════╝

    bat
    coreutils-full
    fastfetch
    iw
    killall
    libnotify
    pciutils
    ripgrep
    trashy

    # ███████╗███████╗ ██████╗██╗   ██╗██████╗ ██╗████████╗██╗   ██╗
    # ██╔════╝██╔════╝██╔════╝██║   ██║██╔══██╗██║╚══██╔══╝╚██╗ ██╔╝
    # ███████╗█████╗  ██║     ██║   ██║██████╔╝██║   ██║    ╚████╔╝
    # ╚════██║██╔══╝  ██║     ██║   ██║██╔══██╗██║   ██║     ╚██╔╝
    # ███████║███████╗╚██████╗╚██████╔╝██║  ██║██║   ██║      ██║
    # ╚══════╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝   ╚═╝      ╚═╝

    protonvpn-gui
    veracrypt

    #  ██████╗ ███████╗███████╗██╗ ██████╗███████╗
    # ██╔═══██╗██╔════╝██╔════╝██║██╔════╝██╔════╝
    # ██║   ██║█████╗  █████╗  ██║██║     █████╗
    # ██║   ██║██╔══╝  ██╔══╝  ██║██║     ██╔══╝
    # ╚██████╔╝██║     ██║     ██║╚██████╗███████╗
    #  ╚═════╝ ╚═╝     ╚═╝     ╚═╝ ╚═════╝╚══════╝

    obsidian
    onlyoffice-bin
    ticktick
    zotero

    # ██╗███╗   ███╗ █████╗  ██████╗ ███████╗
    # ██║████╗ ████║██╔══██╗██╔════╝ ██╔════╝
    # ██║██╔████╔██║███████║██║  ███╗█████╗
    # ██║██║╚██╔╝██║██╔══██║██║   ██║██╔══╝
    # ██║██║ ╚═╝ ██║██║  ██║╚██████╔╝███████╗
    # ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝

    gimp
    imagemagick
    inkscape
    viu

    # ██╗   ██╗██╗██████╗ ███████╗ ██████╗
    # ██║   ██║██║██╔══██╗██╔════╝██╔═══██╗
    # ██║   ██║██║██║  ██║█████╗  ██║   ██║
    # ╚██╗ ██╔╝██║██║  ██║██╔══╝  ██║   ██║
    #  ╚████╔╝ ██║██████╔╝███████╗╚██████╔╝
    #   ╚═══╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝

    celluloid
    ffmpeg
    obs-studio
    davinci-resolve

    # ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███╗   ███╗███████╗███╗   ██╗████████╗
    # ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
    # ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝██╔████╔██║█████╗  ██╔██╗ ██║   ██║
    # ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║
    # ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ██║ ╚═╝ ██║███████╗██║ ╚████║   ██║
    # ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝

    # editors
    neovim
    vscode

    # nix
    alejandra
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
    distrobox
    gpt4all

    #  ██████╗  █████╗ ███╗   ███╗██╗███╗   ██╗ ██████╗
    # ██╔════╝ ██╔══██╗████╗ ████║██║████╗  ██║██╔════╝
    # ██║  ███╗███████║██╔████╔██║██║██╔██╗ ██║██║  ███╗
    # ██║   ██║██╔══██║██║╚██╔╝██║██║██║╚██╗██║██║   ██║
    # ╚██████╔╝██║  ██║██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝
    #  ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝

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
