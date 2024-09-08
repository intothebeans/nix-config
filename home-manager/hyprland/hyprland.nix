{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [
    ./dunst/dunst.nix
    ./rofi/rofi.nix
    ./modules/default.nix
    ./waybar/waybar.nix
    ./hyprlock/hyprlock.nix
  ];
  home.packages = with pkgs; [
    emote
    hyprpicker
    hyprshade
    grimblast
    wl-clipboard
    cliphist
    swappy
    lxqt.lxqt-policykit
  ];
  home.file = {
    ".config/hypr/scripts" = {
      source = ./scripts;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "eDP-1, 1920x1080, 1920x0, 1"
        "HDMI-A-4, 1920x1080, 0x0, 1"
      ];
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "__GL_VRR_ALLOWED,1"
        "WLR_DRM_NO_ATOMIC,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "MOZ_ENABLE_WAYLAND,1"
        "GDK_SCALE,1"
        "GDK_BACKEND,wayland,x11"
        "SDL_VIDEODRIVER,wayland"
      ];
      # hardware
      input = {
        kb_layout = "us";
        follow_mouse = 2;
        sensitivity = 0;
        force_no_accel = 1;
        numlock_by_default = true;
        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };
      cursor = {
        no_hardware_cursors = true;
      };

      # layouts
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      general = {
        gaps_out = "0 20 20 20";
        gaps_in = 5;
      };
      decoration = {
        rounding = 10;
      };
      # misc
      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
