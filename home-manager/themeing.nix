{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages =
    (with pkgs; [
      base16-schemes
      (tela-circle-icon-theme.override
        {colorVariants = ["green"];})
      gnome-tweaks
      gnome-extension-manager
    ])
    ++ (with pkgs.gnomeExtensions; [
      appindicator
      arcmenu
      astra-monitor
      bluetooth-quick-connect
      blur-my-shell
      caffeine
      clipboard-indicator
      color-picker
      coverflow-alt-tab
      dash2dock-lite
      desktop-cube
      media-controls
      pop-shell
    ]);
  stylix = {
    fonts = with pkgs; {
      sansSerif = {
        name = "CodeNewRoman Nerd Font";
        package = nerdfonts.override {fonts = ["CodeNewRoman"];};
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
