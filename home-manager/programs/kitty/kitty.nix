{
  pkgs,
  config,
  ...
}: {
  programs.kitty = {
    enable = true;
    font = {
      size = 12;
      name = "JetBrainsMono Nerd Font";
    };
    shellIntegration.enableZshIntegration = true;
    theme = "Gruvbox Dark";
    settings = {
      disable_ligatures = "cursor";
      cursor_shape = "block";
      cursor_beam_thickness = 4;

      tab_bar_style = "custom";
      tab_bar_min_tabs = 1;
      tab_bar_edge = "bottom";
      tab_bar_align = "left";
      tab_bar_margin_width = 0;
      tab_bar_margin_height = 0;
      tab_title_template = "{f'{title[:30]}…' if title.rindex(title[-1]) + 1 > 30 else (title.center(6) if (title.rindex(title[-1]) + 1) % 2 == 0 else title.center(5))}";
      active_tab_font_style = "bold";
      tab_activity_symbol = "none";
      tab_seperator = "";
      background_blur = 1;
    };
  };
  home.file.".config/kitty/tab_bar.py".source = ./tab_bar.py;
}
