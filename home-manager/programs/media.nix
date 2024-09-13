{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    # images
    imagemagick
    inkscape
    viu
    gimp
    mate.eom

    # ocr
    tesseract
    poppler_utils

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
