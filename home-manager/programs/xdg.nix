{
  config,
  pkgs,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
      xdg-desktop-portal
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      kdePackages.xdg-desktop-portal-kde
    ];
    config = {
      common = {
        default = [
          "xdph"
          "kde"
        ];
        "org.freedesktop.portal.Secret" = ["gnome-keyring"];
        "org.freedesktop.portal.FileChooser" = ["xdg-desktop-protal-kde"];
      };
    };
  };
}
