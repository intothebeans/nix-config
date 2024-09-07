{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "Super";
    "$rofiApp" = "$HOME/.config/rofi/applets/bin";
    "$rofiLaunch" = "$HOME/.config/rofi/launchers";
    "$hyprScripts" = "$HOME/.config/hypr/scripts";
    "$moveactivewindow" = "grep -q 'true' <<< &(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive";

    "$term" = "kitty";
    "$editor" = "code";
    "$file" = "dolphin";
    "$browser" = "firefox";

    bind = [
      # session/windows
      "$mainMod, Q, exec, $hyprScripts/dontkillsteam.sh" # quit window
      "Alt, F4, exec, $hyprScripts/dontkillsteam.sh"
      "$mainMod, Delete, exit," # exit Hyprland session
      "$mainMod, W, togglefloating," # toggle floating
      "$mainMod, G, togglegroup," # toggle group
      "Alt, Return, fullscreen," # toggle fullscreen
      "$mainmod+Shift, F, exec, $hyprScripts/windowpin.sh" # toggle pin
      "$mainMod, Backslash, exec, hyprlock" # lock
      "$mainMod, Backspace, exec, $rofiApp/powermenu.sh" # powermenu
      "Ctrl+Alt, W, exec, killall waybar || waybar" # toggle waybar

      # apps
      "Ctrl+Alt, R, pass, ^(com\.obsproject\.Studio)$" # toggle obs screen recording
      "Ctrl+Alt, P, pass, ^(com\.obsproject\.Studio)$" # toggle obs recording pause
      "$mainMod, T, exec, $term"
      "$mainMod, E, exec, $file"
      "$mainMod, C, exec, $editor"
      "$mainMod, F, exec, $browser"
      "Ctrl+Shift, Escape, exec, btop"
      "$mainMod+Shift, C, exec, hyprpicker -a -f hex"
      "$mainMod+Alt+Shift, C, exec, hyprpicker -a -f rgb"
      "$mainMod+Alt, XF86MonBrightnessDown, exec, hyprshade on blue-light-filter"
      "$mainMod+Alt, XF86MonBrightnessUp, exec, hyprshade off"
      "Ctrl+Shift, Space, exec, 1password --quick-access"
      "$mainMod, Semicolon, exec, ticktick"
      "$mainMod, O, exec, obsidian"

      # rofi
      "Alt, Space, exec, $rofiLaunch/type-2/launcher.sh" # app launcher
      "$mainMod, A, exec, $rofiApp/apps.sh" # quick apps
      "$mainMod, Period, exec, emote" # emojis
      "$mainMod, M, exec, $rofiApp/mpd.sh" # music controls
      ", Insert, exec, $rofiApp/clipboard.sh" # clipboard manager

      # screenshot
      "$mainMod, P, exec, $hyprScripts/screenshot.sh s" # partial screenshot
      "$mainMod+Ctrl, P, exec , $hyprScripts/screenshot.sh sf" # partial screenshot w/ frozen screen
      "$mainMod+Alt, P, exec, $hyprScripts/screenshot.sh m" # screenshot of focused monitor
      ",Print,exec, $hyprScripts/screenshot.sh p" # screenshot all monitors

      # grouped windows
      "$mainMod+Ctrl, U, changegroupactive, b"
      "$mainMod+Ctrl, I, changegroupactive, f"

      # move/change window focus
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, J, movefocus, u"
      "$mainMod, K, movefocus, d"
      "Alt, Tab, movefocus, d"

      # switch workspaces
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # special workspaces
      "$mainMod+Shift, O, workspace, 20"

      "$mainmod+Ctrl, L, workspace, r+1"
      "$mainmod+Ctrl, H, workspace, r-1"

      "$mainMod+Ctrl, J, workspace, empy" # move to first empty workspace

      # move focused window to workspace
      "$mainMod+Shift, 1, movetoworkspace, 1"
      "$mainMod+Shift, 2, movetoworkspace, 2"
      "$mainMod+Shift, 3, movetoworkspace, 3"
      "$mainMod+Shift, 4, movetoworkspace, 4"
      "$mainMod+Shift, 5, movetoworkspace, 5"
      "$mainMod+Shift, 6, movetoworkspace, 6"
      "$mainMod+Shift, 7, movetoworkspace, 7"
      "$mainMod+Shift, 8, movetoworkspace, 8"
      "$mainMod+Shift, 9, movetoworkspace, 9"
      "$mainMod+Shift, 0, movetoworkspace, 10"

      # move focused window to relative workspace
      "$mainMod+Shift+Ctrl, l, movetoworkspace, r+1"
      "$mainMod+Shift+Ctrl, h, movetoworkspace, r-1"

      # scroll through workspaces
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # special workspace
      "$manMod_Alt, S, movetoworkspacesilent, special"
      "$mainMod, S, togglespecialworkspace,"

      # toggle window split
      "$mainMod+Shift, M, togglesplit"

      # move focused window to workspace silently
      "$mainMod+Alt, 1, movetoworkspacesilent, 1"
      "$mainMod+Alt, 2, movetoworkspacesilent, 2"
      "$mainMod+Alt, 3, movetoworkspacesilent, 3"
      "$mainMod+Alt, 4, movetoworkspacesilent, 4"
      "$mainMod+Alt, 5, movetoworkspacesilent, 5"
      "$mainMod+Alt, 6, movetoworkspacesilent, 6"
      "$mainMod+Alt, 7, movetoworkspacesilent, 7"
      "$mainMod+Alt, 8, movetoworkspacesilent, 8"
      "$mainMod+Alt, 9, movetoworkspacesilent, 9"
      "$mainMod+Alt, 0, movetoworkspacesilent, 10"
    ];
    binded = [
      # move active window around current workspace
      "$mainMod SHIFT $CONTROL, left,Move activewindow to the right,exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l"
      "$mainMod SHIFT $CONTROL, right,Move activewindow to the right,exec, $moveactivewindow 30 0 || hyprctl dispatch movewindow r"
      "$mainMod SHIFT $CONTROL, up,Move activewindow to the right,exec, $moveactivewindow  0 -30 || hyprctl dispatch movewindow u"
      " $mainMod SHIFT $CONTROL, down,Move activewindow to the right,exec, $moveactivewindow 0 30 || hyprctl dispatch movewindow d"
    ];
    binde = [
      # resize windows
      "$mainMod+Shift, H, resizeactive, -30 0"
      "$mainMod+Shift, L, resizeactive, 30 0"
      "$mainMod+Shift, J, resizeactive, 0 30"
      "$mainMod+Shift, K, resizeactive, 0 -30"
    ];
    bindl = [
      # audio
      ", XF86AudioMute, exec, $hyprScripts/volumecontrol.sh -o m"
      ", XF86AudioMicMute, exec, $hyprScripts/volumecontrol.sh -i m"

      # media control
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
    ];
    bindel = [
      # brightness
      ", XF86MonBrightnessUp, exec, $hyprScripts/brightnesscontrol.sh i"
      ", XF86MonBrightnessDown, exec, $hyprScripts/brightnesscontrol.sh d"

      # audio
      ", XF86AudioRaiseVolume, exec, $hyprScripts/volumecontrol.sh -o i"
      ", XF86AudioLowerVolume, exec, $hyprScripts/volumecontrol.sh -o d"
    ];
    bindm = [
      # mouse bindings
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
      "$mainMod, Z, movewindow"
      "$mainMod, X, resizewindow"
    ];
  };
}
