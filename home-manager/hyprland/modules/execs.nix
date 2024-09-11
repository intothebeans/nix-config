{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "ags"
      "lxqt-policykit-agent"
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
