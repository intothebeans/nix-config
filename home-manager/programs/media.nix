{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # images
    kdePackages.qtimageformats
    imagemagick
    inkscape
    viu
    gimp

    # video
    haruna
    ffmpeg

    # audio
    wireplumber
    pavucontrol
    pamixer
    playerctl
  ];
  services.playerctld.enable = true;
}
