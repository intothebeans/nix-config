{
  pkgs,
  username,
  lib,
  ...
}:
{
  nix.settings.trusted-users = [ "admin" ];
  programs.zsh.enable = true;
  users.groups.sshuser = { };
  users.users.${username} = {
    isNormalUser = true;
    description = "Aiden";
    extraGroups = [
      "wheel"
      "docker"
      "sshuser"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM"
    ];
    packages = with pkgs; [
      glances
    ];
  };
  systemd.services.glances = {
    unitConfig = {
      Description = "Glances";
      After = [ "network.target" ];
    };
    serviceConfig = {
      ExecStart = "${pkgs.glances}/bin/glances -w --disable-process";
      Restart = "always";
      RemainAfterExit = "no";
    };
    wantedBy = [ "multi-user.target" ];
  };
}
