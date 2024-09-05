{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [];
  wayland.windowManager.hyprland = {
    enable = true;
  };
}
