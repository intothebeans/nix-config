{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    emacs
    fuse
    glances
    just
    ncdu
    nil
    nixfmt-rfc-style
    p7zip
    ripgrep
    tmux
    trash-cli
    unzip
    zip
  ];
  programs.btop.enable = true;
}
