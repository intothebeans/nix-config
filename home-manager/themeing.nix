{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
  ];
}
