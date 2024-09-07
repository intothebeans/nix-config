{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    workspace = [
      "1, defaultName: 󱚣 home, default: true, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593"
      "2, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593, defaultName: 󰨞 code, rounding:false, decorate:false, gapsin:0, gapsout:0, on-created-empty: code, border:true"
      "3, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593, defaultName: 󰊗 games"
      "4, default: true, monitor:desc:LG Display 0x05D0, defaultName:  media, on-created-empty: firefox --new-window=\"https://youtube.com\""
      "5, monitor:desc:ViewSonic Corporation VX2252 Series TVR164260593, defaultName: Other, gapsout:5"
      "6, defaultName: 󰄛 laptop, monitor:desc:LG Display 0x05D0"
      "20, defaultName: 󰄄 OBS, on-created-empty: pidof obs || flatpak run com.obsproject.Studio, decorate:false, rounding:false, gapsin:0, gapsout:3"
    ];
  };
}
