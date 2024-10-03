{
  pkgs,
  username,
  ...
}:
{
  programs.zsh.enable = true;
  users.users.${username} = {
    isNormalUser = true;
    description = "Aiden";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "sshuser"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIsHgZlt7xX7af0RXhTRlP8oqZUuyP70g8q/A7oHDLxM"
    ];
  };
}
