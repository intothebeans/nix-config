{
  config,
  pkgs,
  lib,
  inputs,
  username,
  ...
}: {
  imports = [
    ./programs/default.nix
    ./themeing.nix
    ./hyprland/hyprland.nix
  ];
  nixpkgs.config.allowUnfree = true;

  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
      SUDO_EDITOR = "vim";
    };

    file = {
      ".config/lvim/config.lua".source = ./programs/config-files/lvim.lua;
      ".config/code-flags.conf".source = ./programs/config-files/code-flags.conf;
      ".config/winapps/winapps.conf".source = ./programs/winapps/winapps.conf;
    };

    # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
    stateVersion = "24.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";
}
