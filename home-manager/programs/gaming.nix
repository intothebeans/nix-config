{pkgs, ...}: {
  home.packages = with pkgs; [
    steam
    mangohud
    gamescope
    lutris
    modrinth-app
    prismlauncher
    wine
    winetricks
    vesktop
  ];
}
