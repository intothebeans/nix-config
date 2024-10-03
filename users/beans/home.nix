{
  username,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ../../home-manager/themeing.nix
    ./programs.nix
    ../../home-manager/xdg.nix
    ../../home-manager/programs/terminal/terminal.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "vim";
      PATH = "$PATH:$HOME/.local/bin";
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
      XDG_DATA_DIRS = "/var/lib/flatpak/exports/share:/home/beans/.local/share/flatpak/exports/share:$XDG_DATA_DIRS";
    };

    file = {
      ".config/code-flags.conf".source = ../../home-manager/config-files/code-flags.conf;
      ".config/winapps/winapps.conf".source = ../../home-manager/programs/winapps/winapps.conf;
      ".config/custom.omp.toml".source = ../../home-manager/config-files/custom.omp.toml;
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
      user = {
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEYVFPUEzp3ImUQgOhymVptRA1DlbuNnMzyO/Xao2OfI";
      };

      gpg = {
        format = "ssh";
      };

      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };

      commit = {
        gpgsign = true;
      };
      init = {
        defaultBranch = "main";
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
