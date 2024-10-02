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
      "libvirt"
      "sshuser"
    ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOlBs5J+/fm3x4xOClnOMLmOqoz5Qz/SCS6fF/ggzJP2"
    ];
  };
}
