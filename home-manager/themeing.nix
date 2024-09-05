{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.qt5compat
  ];
  stylix = {
    fonts = {
      sansSerif.name = "ComicShannsMono Nerd Font";
      sansSerif.package = pkgs.nerdfonts.override {fonts = ["ComicShannsMono"];}; # I'm a bit kooky
    };
    opacity = {
      applications = 0.8;
      desktop = 0.6;
    };
    targets = {
      neovim = {
        transparentBackground.main = true;
      };
      vscode.enable = lib.mkDefault false;
    };
  };
}
