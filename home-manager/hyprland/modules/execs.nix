{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "waybar"
      "blueman-applet"
      "nm-applet"
      "dunst"
      "wl-paste --type text --watch cliphist store"
      "wl-paste --type image --watch cliphist store"
      "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      "hypridle"
      "1password"
      "playerctld daemon"
      "gsettings set org.gnome.desktop.interface icon-theme 'Whitesur-green-dark'"
      "hyprctl setcursor 'capitaine-cursors' 20"
      "gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'"
      "gsettings set org.gnome.desktop.interface cursor-size 20"
    ];
  };
}
