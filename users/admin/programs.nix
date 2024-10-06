{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    emacs
    emacsPackages.doom
    just
    ncdu
    nil
    nixfmt-rfc-style
    p7zip
    ranger
    ripgrep
    tmux
    trashy
    unzip
    zip
  ];
}
