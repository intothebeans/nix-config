{pkgs, ...}: {
  programs.hyprlock = {
    enable = true;
    settings = {
      source = [
        "${./. + "/gruvbox.conf"}"
      ];
      "$accent" = "$lightAqua";
      "$accentAlpha" = "$aqua";
      "$font" = "JetBrains Mono Nerd Font";

      general = {
        disable_loading_bar = false;
        hide_cursor = true;
      };
      background = {
        monitor = "";
        path = "$HOME/.config/background";
        blur_passes = 1;
        color = "$bg0";
      };

      label = [
        {
          monitor = "";
          text = "Layout: $LAYOUT";
          color = "$fg0";
          font_size = 25;
          font_family = "$font";
          position = "30, -30";
          halighn = "left";
          valign = "top";
        }
        {
          monitor = "";
          text = "$TIME";
          color = "$fg0";
          font_size = 90;
          font_family = "$font";
          position = "-30, 0";
          halighn = "right";
          valign = "top";
        }
        {
          monitor = "";
          text = "cmd[update:43200000] date +'%A, %d %B %Y'";
          color = "$fg0";
          font_size = 25;
          font_family = "$font";
          position = "-30, -150";
          halighn = "right";
          valign = "top";
        }
      ];
      image = {
        monitor = "";
        path = "$HOME/.face";
        size = 100;
        border_color = "$accent";
        position = "0, 75";
        halign = "center";
        valign = "bottom";
      };
      input-field = {
        monitor = "";
        size = "300, 60";
        outline_thickness = 4;
        dots_size = "0.2";
        dots_spacing = "0.2";
        dots_center = true;
        outer_color = "$accent";
        inner_color = "$bg2";
        font_color = "$fg0";
        fade_on_empty = false;
        placeholder_text = "<span foreground=\"##$textAlpha\"><i>󰌾 Logged in as </i><span foreground=\"##$accentAlpha\">$USER</span></span>";
        hide_input = false;
        check_color = "$accent";
        fail_color = "$red";
        fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
        capslock_color = "$yellow";
        position = "0, -47";
        halign = "center";
        valign = "center";
      };
    };
  };
}
