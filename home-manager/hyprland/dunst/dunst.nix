{config, ...}: {
  services.dunst = {
    # colors done by stylix
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        width = "(0, 600)";
        height = 350;
        progress_bar = true;
        progress_bar_height = 25;
        progress_bar_frame_width = 3;
        progress_bar_min_width = 460;
        progress_bar_max_width = 480;
        indicate_hidden = true;
        shrink = true;
        transparency = 5;
        padding = 10;
        horizontal_padding = 10;
        frame_width = 0;
        sort = true;
        idle_threshold = 0;
        line_height = 2;
        markup = "full";
        origin = "top-right";
        offset = "10x10";
        format = "<b>%s</b>\n%b";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        ignore_newlines = true;
        stack_duplicates = true;
        hide_duplicate_count = false;
        show_indicators = true;
        icon_position = "left";
        max_icon_size = 86;
        min_icon_size = 32;
        enable_recursive_icon_lookup = true;
        sticky_history = true;
        history_length = 20;
        browser = "firefox";
        always_run_script = true;
        title = "Dunst";
        class = "dunst";
        corner_radius = 10;
        icon_corner_radius = 5;
        notification_limit = 5;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action";
        mouse_right_click = "context_all";
        ignore_dbusclose = true;
        ellipsize = "middle";
      };

      urgency_low = {
        timeout = 2;
      };

      urgency_normal = {
        timeout = 6;
      };

      urgency_critical = {
        timeout = 30;
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
  home.file.".config/dunst/notify.sh".source = ./notify.sh;
}
