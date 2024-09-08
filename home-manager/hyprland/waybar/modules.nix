{config, ...}: {
  programs.waybar.settings = {
    mainBar = {
      backlight = {
        device = "intel_backlight";
        format = "{icon} {percentage}%";
        format-icons = ["" "" "" "" "" "" "" "" ""];
        on-scroll-up = "brightnessctl set 1%+";
        on-scroll-down = "brightnessctl set 1%-";
        min-length = 6;
      };

      battery = {
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{time} {icon}";
        format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
      };

      clock = {
        format = "{:%I:%M %p}";
        format-alt = "{:%R 󰃭 %d·%m·%y}";
        tooltip-format = "<span>{calendar}</span>";
        calendar = {
          mode = "month";
          mode-mon-col = 3;
          on-scroll = 1;
          on-click-right = "mode";
          format = {
            month = "<span color='#ffead3'><b>{}</b></span>";
            weekdays = "<span color='#ffcc66'><b>{}</b></span>";
            today = "<span color='#ff6699'><b>{}</b></span>";
          };
        };
        actions = {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };
      };

      cpu = {
        interval = 10;
        format = "󰍛 {usage}%";
        format-alt = "{icon0}{icon1}{icon2}{icon3}";
        format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
      };

      idle_inhibitor = {
        format = "{icon}";
        format-icons = {
          "activated" = "󰥔";
          "deactivated" = "";
        };
      };

      memory = {
        states = {
          c = 90;
          h = 60;
          m = 30;
        };
        interval = 30;
        format = "󰾆 {used}GB";
        format-m = "󰾅 {used}GB";
        format-h = "󰓅 {used}GB";
        format-c = " {used}GB";
        format-alt = "󰾆 {percentage}%";
        max-length = 10;
        tooltip = true;
        tooltip-format = "󰾆 {percentage}%\n {used:0.1f}GB/{total:0.1f}GB";
      };

      "custom/notifications" = {
        format = "{icon} {}";
        format-icons = {
          email-notification = "<span foreground='white'><sup></sup></span>";
          chat-notification = "󱋊<span foreground='white'><sup></sup></span>";
          warning-notification = "󱨪<span foreground='yellow'><sup></sup></span>";
          error-notification = "󱨪<span foreground='red'><sup></sup></span>";
          network-notificaiton = "󱂇<span foreground='white'><sup></sup></span>";
          battery-notification = "󰁺<span foreground='white'><sup></sup></span>";
          music-notification = "󰝚<span foreground='white'><sup></sup></span>";
          volume-notification = "󰕿<span foreground='white'><sup></sup></span>";
          notification = "<span foreground='white'><sup></sup></span>";
          dnd = "";
          none = "";
        };
        return-type = "json";
        exec-if = "which dunstctl";
        exec = "$HOME/.config/hypr/scripts/notifications.py";
        on-scroll-down = "sleep 0.1 && dunstctl history-pop";
        on-click = "dunstctl set-paused toggle";
        on-click-middle = "dunstctl history-clear";
        on-click-right = "dunstctl close-all";
        interval = 1;
        tooltip = true;
        escape = true;
      };

      "custom/power" = {
        format = "{}";
        exec = "echo ; echo  logout";
        on-click = "$HOME/.config/rofi/applets/bin/powermenu.sh";
        interval = 86400;
        tooltip = true;
      };

      power-profiles-daemon = {
        format = "{icon}";
        tooltip-format = "Power profile: {profile}\nDriver: {driver}";
        tooltip = true;
        format-icons = {
          default = " 󱐋";
          performance = " 󱐋";
          balanced = "  ";
          power-saver = " ";
        };
      };

      pulseaudio = {
        format = "{icon} {volume}";
        format-muted = "󰝟";
        on-click = "pavucontrol -t 3";
        on-click-right = "$HOME/.config/hypr/scripts/volumecontrol.sh -s ''";
        on-click-middle = "$HOME/.config/hypr/scripts/volumecontrol.sh -o m";
        on-scroll-up = "$HOME/.config/hypr/scripts/volumecontrol.sh -o i";
        on-scroll-down = "$HOME/.config/hypr/scripts/volumecontrol.sh -o d";
        tooltip-format = "{icon} {desc} // {volume}%";
        scroll-step = 5;
        format-icons = {
          "headphone" = "";
          "hands-free" = "";
          "headset" = "";
          "phone" = "";
          "portable" = "";
          "car" = "";
          "default" = ["" "" ""];
        };
      };

      "pulseaudio#mic" = {
        format = "{format_source}";
        format-source = "";
        format-source-muted = "";
        on-click = "pavucontrol -t 4";
        on-click-middle = "$HOME/.config/hypr/scripts/volumecontrol.sh -i m";
        on-scroll-up = "$HOME/.config/hypr/scripts/volumecontrol.sh -i i";
        on-scroll-down = "$HOME/.config/hypr/scripts/volumecontrol.sh -i d";
        tooltip-format = "{format_source} {source_desc} // {source_volume}%";
        scroll-step = 5;
      };

      "custom/spotify" = {
        exec = "$HOME/.config/hypr/scripts/mediaplayer.py --player spotify";
        format = " {}";
        return-type = "json";
        on-click = "playerctl play-pause --player spotify";
        on-click-right = "playerctl next --player spotify";
        on-click-middle = "playerctl previous --player spotify";
        on-scroll-up = "$HOME/.config/hypr/scripts/volumecontrol.sh -p spotify i";
        on-scroll-down = "$HOME/.config/hypr/scripts/volumecontrol.sh -p spotify d";
        max-length = 25;
        escape = true;
        tooltip = true;
      };

      tray = {
        icon-size = 14;
        show-passive-items = true;
        spacing = 10;
      };

      "hyprland/window" = {
        format = "{}";
        separate-outputs = true;
        rewrite = {
          #"(.*) — Mozilla Firefox" = "$1 󰈹";
          "(.*)Mozilla Firefox" = "Firefox 󰈹";
          "(.*) - Visual Studio Code" = "$1 󰨞";
          "(.*)Visual Studio Code" = "Code 󰨞";
          "(.*) — Dolphin" = "$1 󰉋";
          "(.*)Spotify" = "Spotify 󰓇";
          "(.*)Steam" = "Steam 󰓓";
        };
        max-length = 500;
      };

      "hyprland/workspaces" = {
        disable-scroll = false;
        rotate = "$'{r_deg}";
        all-outputs = true;
        on-click = "activate";
        on-scroll-up = "hyprctl dispatch workspace -1";
        on-scroll-down = "hyprctl dispatch workspace +1";
      };

      # layout
      "custom/l_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/r_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/sl_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/sr_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/rl_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/rr_end" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
      "custom/padd" = {
        format = " ";
        interval = "once";
        tooltip = false;
      };
    };
  };
}
