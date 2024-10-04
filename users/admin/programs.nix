{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    emacs
    glances
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
