{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [];
  home.packages = with pkgs; [
    rofi-wayland
    waybar
    dunst
    hyprpicker
  ];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
