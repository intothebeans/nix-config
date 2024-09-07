{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./dunst/dunst.nix
    ./rofi/rofi.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];
  home.packages = with pkgs; [
    rofi-emoji-wayland
    waybar
    hyprpicker
    grimblast
    wl-clipboard
    cliphist
    pyprland
    swww
    swappy
    wlogout
    slurp
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
