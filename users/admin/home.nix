{
  username,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./programs.nix
    ../../home-manager/programs/terminal/terminal.nix
  ];
  kittyConfig.enable = lib.mkDefault false;
  nixpkgs.config.allowUnfree = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "vim";
      SUDO_EDITOR = "vim";
      PATH = "$PATH:$HOME/.local/bin";
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };
  programs.ssh = {
    enable = true;
    forwardAgent = true;
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