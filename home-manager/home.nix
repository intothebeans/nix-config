{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ./zsh.nix
    ./vim.nix
  ];
  # nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;

  };

  home.username = "beans";
  home.homeDirectory = "/home/beans";

  home.packages = with pkgs; [

    # terminal utils
    fastfetch
    oh-my-posh

    # archives
    zip
    xz
    unzip
    p7zip

    # system
    btop
    flatpak

    # nix devel
    nil
    nixfmt-rfc-style

    # gen devel
    kdePackages.kate
    neovim
    nodejs_22
    vscode
    just

    # internet
    protonvpn-gui
    vesktop
    github-desktop

    # gaming
    steam
    mangohud
    gamescope
    lutris
    modrinth-app
    prismlauncher
    wine
    winetricks

    # files
    veracrypt
    inkscape
    gimp
    vlc
    nextcloud-client
    qbittorrent-enhanced
    kdePackages.qtimageformats

    # office
    ticktick
    onlyoffice-bin
    obsidian

    # fonts
    (nerdfonts.override {
      fonts = [
        "JetBrainsMono"
        "ComicShannsMono"
        "CascadiaCode"
      ];
    })
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "vim";
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        IdentityAgent ~/.1password/agent.sock
    '';
  };

  programs.git = {
    enable = true;
    userName = "Aiden";
    userEmail = "88350376+intothebeans@users.noreply.github.com";
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
      commit = {
        gpgsign = true;
      };

      user = {
        signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEYVFPUEzp3ImUQgOhymVptRA1DlbuNnMzyO/Xao2OfI";
      };
    };
  };

  home.file = {
    ".config/nvim" = {
      source = ./nvim;
      recursive = true;
    };

    ".config/kitty" = {
      source = ./kitty;
      recursive = true;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
