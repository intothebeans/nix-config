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
    alsa-utils
    mpd
    mpc-cli
    mpdris2
  ];
  services.playerctld.enable = true;
}
