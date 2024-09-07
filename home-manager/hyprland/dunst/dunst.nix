{config, ...}: {
  services.dunst = {
    # colors done by stylix
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = 300;
        height = 350;
        origin = "top-right";
        offset = "20x20";
        scale = 0;
        notification_limit = 20;
        progress_bar = true;
        progress_bar_height = 10;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 0;
        progress_bar_max_width = 125;
        progress_bar_corner_radius = 4;
        icon_corner_radius = 10;
        indicate_hidden = true;
        transparency = 10;
        sperator_height = 2;
        padding = 8;
        horizontal_padding = 8;
        text_icon_padding = 10;
        frame_width = 5;
        gap_size = 5;
        sort = true;
        line_height = 3;
        markup = "full";
        format = "%s\n%b";
        alignment = "left";
        vertical_alignment = "center";
        show_age_threshold = 60;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        enable_recursive_icon_lookup = true;
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 128;
        sticky_history = true;
        history_length = 20;
        browser = "firefox";
        always_run_script = true;
        title = "Dunst";
        class = "Dunst";
        corner_radius = 10;
        ignore_dbusclose = false;
        mouse_left_click = "context, close_current";
        mouse_middle_click = "do_action, close_surrent";
        mouse_right_click = "close_all";
      };

      urgency_low = {
        timeout = 2;
      };

      urgency_normal = {
        timeout = 6;
      };

      urgency_critical = {
        timeout = 30;
        icon = "$HOME/.config/dunst/icons/critical.svg";
      };

      fullscreen_show_critical = {
        msg_urgency = "critical";
        fullscreen = "pushback";
      };

      firefox = {
        appname = "firefox";
        new_icon = "firefox-default";
      };

      network = {
        appname = "network";
        new_icon = "network";
        summary = "*";
        format = "<span size='x-large' weight='bold'>%s</span>\n<span >%b</span>";
      };

      "NetworkManager Applet" = {
        appname = "NetworkManager Applet";
        new_icon = "network-wireless";
      };
    };
  };
  home.file.".config/dunst/icons".source = ./icons;
  home.file.".config/dunst/icons".recursive = true;
}
