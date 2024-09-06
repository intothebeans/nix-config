{
  pkgs,
  lib,
  ...
}: {
  # 1password needs to be installed at a system level to enable
  # integration with the browser extension
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
        signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM";
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
    };
  };
}
