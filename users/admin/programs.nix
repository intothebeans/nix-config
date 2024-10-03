{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    glances
    jdk22
    ncdu
    p7zip
    peergos
    ranger
    ripgrep
    tmux
    trashy
    unzip
    zip
  ];
}
