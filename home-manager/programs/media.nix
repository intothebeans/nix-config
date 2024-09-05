{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.qtimageformats
    haruna
    ffmpeg
    imagemagick
    inkscape
    gimp
    viu
    wireplumber
    pavucontrol
  ];
  services.playerctld.enable = true;
}
