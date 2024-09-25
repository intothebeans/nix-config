{pkgs, ...}: {
  home.packages = with pkgs; [
    # ███████╗██╗██╗     ███████╗███████╗
    # ██╔════╝██║██║     ██╔════╝██╔════╝
    # █████╗  ██║██║     █████╗  ███████╗
    # ██╔══╝  ██║██║     ██╔══╝  ╚════██║
    # ██║     ██║███████╗███████╗███████║
    # ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝

    appimage-run
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
    flatpak
    killall
    libnotify
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

    #  ██████╗  ██████╗██████╗
    # ██╔═══██╗██╔════╝██╔══██╗
    # ██║   ██║██║     ██████╔╝
    # ██║   ██║██║     ██╔══██╗
    # ╚██████╔╝╚██████╗██║  ██║
    #  ╚═════╝  ╚═════╝╚═╝  ╚═╝

    poppler_utils
    tesseract

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
