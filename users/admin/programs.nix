{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    emacs
    glances
    just
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
