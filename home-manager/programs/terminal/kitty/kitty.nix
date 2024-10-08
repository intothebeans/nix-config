{
  pkgs,
  config,
  lib,
  ...
}:
{
  options = {
    kittyConfig.enable = lib.mkEnableOption "Enable kitty terminal";
  };
  config = lib.mkIf config.kittyConfig.enable {
    programs.kitty = {
      enable = true;
      font = {
        size = 12;
        name = "JetBrainsMono Nerd Font";
      };
      shellIntegration.enableZshIntegration = true;
      shellIntegration.enableFishIntegration = true;
      themeFile = "GruvboxMaterialDarkHard";
      settings = {
        disable_ligatures = "cursor";
        cursor_shape = "block";
        cursor_beam_thickness = 4;
        enable_audio_bell = false;

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
        background_opacity = lib.mkForce "0.9";
      };
    };
    home.file.".config/kitty/tab_bar.py".source = ./tab_bar.py;
  };
}
