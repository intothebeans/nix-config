{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    mangohud
    lutris
    wine
    winetricks
    vesktop
    protonup
  ];
  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "$HOME/.steam/root/compatibilitytools.d";
  };
}
