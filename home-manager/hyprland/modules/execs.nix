{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "blueman-applet"
      "nm-applet"
      "lxqt-policykit-agent"
      "dunst"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "hypridle"
      "1password"
      "playerctld daemon"
      "$HOME/.config/hypr/scripts/nextcloud.sh"
    ];
  };
}
