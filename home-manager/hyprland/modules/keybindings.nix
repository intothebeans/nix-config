{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "Super";
    "$rofi" = "$HOME/.config/rofi";
    "$hyprScripts" = "$HOME/.config/hypr/scripts";
    "$term" = "kitty";
    "$editor" = "code";
    "$file" = "thunar";
    "$browser" = "firefox";

    bind = [
      # session/windows
      "$mainMod, Q, exec, $hyprScripts/dontkillsteam.sh" # quit window
      ", XF86PowerOff, exec, systemctl suspend"
      "Alt, F4, exec, $hyprScripts/dontkillsteam.sh"
      "$mainMod, Delete, exit," # exit Hyprland session
      "$mainMod, W, togglefloating," # toggle floating
      "$mainMod, G, togglegroup," # toggle group
      "Alt, Return, fullscreen," # toggle fullscreen
      "$mainMod, Backslash, exec, hyprlock" # lock
      "$mainMod, Backspace, exec, ags -t powermenu" # powermenu

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
      "$mainMod+Ctrl, G, exec, $hyprScripts/gamemode.sh"
      "$mainMod, Escape, exec, hyprctl kill"

      # launchers
      "Alt, Space, exec, ags -t launcher" # app launcher
      "$mainMod, Tab, exec, ags -t overview"
      "$mainMod, Period, exec, emote" # emojis
      ", Insert, exec, $rofi/clipboard.sh" # clipboard manager

      # screenshot
      "$mainMod+Shift, Print, exec, ags -r 'recorder.start()'"
      ",Print, exec, ags -r 'recorder.screenshot()'"
      "Alt, Print, exec, ags -r 'recorder.screenshot(true)'"

      # grouped windows
      "$mainMod+Ctrl, U, changegroupactive, b"
      "$mainMod+Ctrl, I, changegroupactive, f"

      # move/change window focus
      "$mainMod, H, movefocus, l"
      "$mainMod, L, movefocus, r"
      "$mainMod, J, movefocus, u"
      "$mainMod, K, movefocus, d"
      "Alt, Tab, movefocus, d"

      # move windows around
      "$mainMod+Shift+Ctrl, H, movewindow, l"
      "$mainMod+Shift+Ctrl, L, movewindow, r"
      "$mainMod+Shift+Ctrl, K, movewindow, u"
      "$mainMod+Shift+Ctrl, J, movewindow, d"

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

      "$mainMod+Ctrl, L, workspace, r+1"
      "$mainMod+Ctrl, H, workspace, r-1"

      "$mainMod+Ctrl, J, workspace, empty" # move to first empty workspace

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
      "$mainMod+Alt+Ctrl, l, movetoworkspace, r+1"
      "$mainMod+Alt+Ctrl, h, movetoworkspace, r-1"

      # scroll through workspaces
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"

      # special workspace
      "$mainMod+Alt, S, movetoworkspacesilent, special"
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
    binde = [
      # resize windows
      "$mainMod+Shift, H, resizeactive, -30 0"
      "$mainMod+Shift, L, resizeactive, 30 0"
      "$mainMod+Shift, J, resizeactive, 0 30"
      "$mainMod+Shift, K, resizeactive, 0 -30"
    ];
    bindel = [
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ", XF86AudioLowerVolume, exec, pamixer -d 5"
      ", XF86AudioRaiseVolume, exec, pamixer -i 5"
    ];
    bindl = [
      # media control
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
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
