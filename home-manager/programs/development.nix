{pkgs, ...}: {
  home.packages = with pkgs; [
    # editors
    kdePackages.kate
    vscode
    neovim

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
