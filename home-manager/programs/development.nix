{pkgs, ...}: {
  home.packages = with pkgs; [
    # editors
    kdePackages.kate
    vscode
    lunarvim

    # development
    nil
    nixfmt-rfc-style
    alejandra
    nodejs
    gcc
    just
    rustup
    github-desktop
  ];
}
