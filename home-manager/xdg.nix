{
  config,
  pkgs,
  ...
}:
{
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config = {
      common = {
        default = [
          "xdph"
          "gtk"
        ];
        "org.freedesktop.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gnome" ];
      };
    };
  };
  xdg.desktopEntries = {
    filen = {
      name = "Filen";
      exec = "${pkgs.appimage-run}/bin/appimage-run /home/beans/AppImages/filen.appimage";
      icon = "/home/beans/AppImages/.icons/filen.png";
      terminal = false;
      type = "Application";
    };
  };
}
