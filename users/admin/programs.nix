{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    emacs
    just
    ncdu
    nil
    nixfmt-rfc-style
    p7zip
    ripgrep
    tmux
    trashy
    unzip
    zip
  ];
  programs.btop.enable = true;
}
