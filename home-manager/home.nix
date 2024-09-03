{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}: {
  imports = [
    ./zsh.nix
    ./vim.nix
  ];
  # nixpkgs config
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    packages = with pkgs; [
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
      alejandra

      # gen devel
      kdePackages.kate
      neovim
      nodejs_22
      vscode
      just

      # libraries
      glib
      glibc
      libnotify

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
    ];

    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "vim";
    };

    file = {
      ".config/nvim" = {
        source = ./nvim;
        recursive = true;
      };
    };
    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
