{ pkgs, ... }:
{
  home.packages = with pkgs; [
    aria2
    bat
    conceal
    emacs
    fuse
    glances
    just
    ncdu
    nil
    nixfmt-rfc-style
    p7zip
    polaris
    ripgrep
    tmux
    unzip
    zip
  ];
  programs.btop.enable = true;
}
