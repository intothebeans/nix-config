{pkgs, ...}: {
  home.packages = with pkgs; [
    steam
    mangohud
    gamescope
    lutris
    wine
    winetricks
    vesktop
  ];
}
