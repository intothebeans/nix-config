{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    code-server
    glances
    jdk22
    p7zip
    ripgrep
    trashy
    unzip
    zip
  ];
}
