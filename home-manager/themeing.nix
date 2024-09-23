{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    base16-schemes
    (tela-circle-icon-theme.override
      {colorVariants = ["green"];})
    gnome-tweaks
    gnome-extension-manager
  ];
  stylix = {
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
  dconf.enable = true;
  programs.gnome-shell = {
    enable = true;
    extensions = with pkgs.gnomeExtensions; [
      {package = appindicator;}
      {package = astra-monitor;}
      {package = blur-my-shell;}
      {package = color-picker;}
      {package = dash2dock-lite;}
      {package = logo-menu;}
      {package = forge;}
      {package = caffeine;}
      {package = clipboard-indicator;}
      {package = desktop-cube;}
      {package = coverflow-alt-tab;}
      {package = media-controls;}
      #{package = just-perfection;}
      #{package = pop-shell;}
    ];
  };
}
