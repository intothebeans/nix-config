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
    pamixer
  ];
  services.playerctld.enable = true;
}
