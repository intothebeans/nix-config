{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
{
  home.packages =
    (with pkgs; [
      base16-schemes
      (tela-circle-icon-theme.override { colorVariants = [ "green" ]; })
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
      desktop-cube
      media-controls
      forge
    ]);
  stylix = {
    fonts = with pkgs; {
      sansSerif = {
        name = "CodeNewRoman Nerd Font";
        package = nerdfonts.override { fonts = [ "CodeNewRoman" ]; };
      };
    };
    targets = {
      neovim = {
        transparentBackground.main = true;
      };
      vscode.enable = lib.mkDefault false;
    };
  };
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        addToQueueTop
        beautifulLyrics
        betterGenres
        fullAlbumDate
        hidePodcasts
        history
        savePlaylists
        showQueueDuration
        shuffle # shuffle+ (special characters are sanitized out of extension names)
        skipStats
      ];
      theme = lib.mkDefault spicePkgs.themes.onepunch;
    };
}
