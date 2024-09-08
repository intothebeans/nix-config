{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "opacity 0.90 0.90,class:^(firefox)$"
      "opacity 0.80 0.80,class:^(Code)$"
      "opacity 0.80 0.80,class:^(code-url-handler)$"
      "opacity 0.80 0.80,class:^(kitty)$"
      "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
      "opacity 0.80 0.80,class:^(org.kde.ark)$"
      "opacity 0.80 0.80,class:^(nwg-look)$"
      "opacity 0.80 0.80,class:^(qt5ct)$"
      "opacity 0.80 0.80,class:^(qt6ct)$"
      "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
      "opacity 0.80 0.70,class:^(blueman-manager)$"
      "opacity 0.80 0.70,class:^(nm-applet)$"
      "opacity 0.80 0.70,class:^(nm-connection-editor)$"
      "opacity 0.80 0.70,title:^(Authentication Required)$"
      "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
      "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
      "opacity 0.70 0.70,class:^([Ss]team)$"
      "opacity 0.70 0.70,class:^(steamwebhelper)$"
      "opacity 0.70 0.70,class:^(Spotify)$"

      "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
      "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
      "float,title:^(About Mozilla Firefox)$"
      "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "float,class:^(firefox)$,title:^(Library)$"
      "float,class:^(kitty)$,title:^(top)$"
      "float,class:^(kitty)$,title:^(btop)$"
      "float,class:^(kitty)$,title:^(powertop)$"
      "float,class:^(vlc)$"
      "float,class:^(haruna)$"
      "float,class:^(qt5ct)$"
      "float,class:^(qt6ct)$"
      "float,class:^(nwg-look)$"
      "float,class:^(org.kde.ark)$"
      "float,class:^(org.pulseaudio.pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,title:^(Authentication Required)$"
      "float,class:^(Rofi)$"
    ];

    layerrule = [
      "blur,Rofi"
      "ignorezero,Rofi"
      "blur,waybar"
      "ignorezero,waybar"
      "blur,notifications"
      "ignorezero,notifications"
      "blur,logout_dialog"
    ];
  };
}
