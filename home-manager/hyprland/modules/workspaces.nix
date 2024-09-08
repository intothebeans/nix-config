{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, defaultName: 󱚣 home, default: true, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593"
      "2, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593, defaultName: 󰨞 code"
      "3, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593, defaultName: 󰊗 games"
      "4, default: true, monitor:desc:LG Display 0x05D0, defaultName:  media"
      "6, defaultName: 󰄛 laptop, monitor:desc:LG Display 0x05D0"
      "20, defaultName: 󰄄 OBS, on-created-empty: pidof obs || flatpak run com.obsproject.Studio"
    ];
  };
}
