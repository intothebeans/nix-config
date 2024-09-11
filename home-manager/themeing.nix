{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    base16-schemes
    (tela-circle-icon-theme.override
      {colorVariants = ["green"];})
    nwg-look
  ];
  qt.style.name = "kvantum";
  stylix = {
    opacity = {
      applications = 0.8;
      desktop = 0.6;
    };
    fonts = with pkgs; {
      sansSerif = {
        name = "ComicShannsMono Nerd Font";
        package = nerdfonts.override {fonts = ["ComicShannsMono"];};
      };
    };
    targets = {
      neovim = {
        transparentBackground.main = true;
      };
      vscode.enable = lib.mkDefault false;
    };
  };
}
