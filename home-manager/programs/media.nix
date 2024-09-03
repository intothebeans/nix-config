{
  pkgs,
  config,
  ...
}: {
  home.programs = with pkgs; [
    kdePackages.qtimageformats
    vlc
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
