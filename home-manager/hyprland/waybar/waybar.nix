{config, ...}: {
  imports = [./modules.nix];
  stylix.targets.waybar.enable = false;
  programs.waybar = {
    enable = true;
    style = ./style.css;
    settings = let
      padding = "custom/padding";
      lend = "custom/l_end";
      rend = "custom/r_end";
      slend = "custom/sl_end";
      srend = "custom/sr_end";
      rrend = "custom/rr_end";
      rlend = "custom/rl_end";
    in {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        height = 31;
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        reload_style_on_change = true;
        modules-left = ["${lend}" "hyprland/workspaces" "${rend}" "" "${lend}" "custom/spotify" "pulseaudio#mic" "pulseaudio" "${rend}" "${padding}"];
        modules-center = ["${padding}" "${rlend}" "hyprland/window" "cpu" "memory" "${rrend}" "${padding}"];
        modules-right = ["${lend}" "tray" "${rend}" "${lend}" "idle_inhibitor" "power-profiles-daemon" "battery" "clock" "custom/notifications" "custom/power" "${rend}" "${padding}"];
      };
    };
  };
}
