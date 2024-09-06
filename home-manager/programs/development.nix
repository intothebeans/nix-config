{pkgs, ...}: {
  home.packages = with pkgs; [
    # editors
    kdePackages.kate
    vscode
    lunarvim

    # nix
    nil
    nixfmt-rfc-style
    alejandra

    # js
    nodejs

    # c
    gcc

    # rust
    rustup

    # python
    python3

    # tools
    just
    github-desktop
  ];
}
