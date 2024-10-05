{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    emacs
    emacsPackages.doom
    glances
    just
    ncdu
    nil 
    nixfmt-rfc-style
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
