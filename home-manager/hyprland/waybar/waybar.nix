{config, ...}: {
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
        modules-left = ["${padding}" "${slend}" "hyprland/workspaces" "${srend}" "${padding}" "${lend}" "custom/spotify" "pulseaudio#mic" "${rend}" "${padding}"];
        modules-center = ["${padding}" "${rlend}" "hyprland/window" "cpu" "memory" "${rrend}" "${padding}"];
        modules-right = ["${padding}" "${lend}" "tray" "${rend}" "${padding}" "${lend}" "idle_inhibitor" "power-profiles-daemon" "custom/cycle_wall" "${rend}" "${padding}" "${lend}" "pulseaudio" "battery" "clock" "${rend}" "${padding}" "${rlend}" "custom/notifications" "${rrend}" "${padding}" "${slend}" "custom/power" "${srend}" "${padding}"];
      };
    };
  };
}
