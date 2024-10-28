{
  pkgs,
  username,
  lib,
  ...
}:
{
  programs.zsh.enable = true;
  users.groups.sshuser = { };
  users.groups.media = { };
  users.users.${username} = {
    isNormalUser = true;
    description = "Aiden";
    extraGroups = [
      "wheel"
      "docker"
      "sshuser"
      "media"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM"
    ];
  };
}
