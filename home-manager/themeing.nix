{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.qt5compat
    kdePackages.qtbase
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtwayland
    kdePackages.qtstyleplugin-kvantum
    nwg-look
    dconf
    (whitesur-icon-theme.override
      {
        alternativeIcons = true;
        themeVariants = ["green"];
      })
  ];
  stylix = {
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
