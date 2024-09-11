{
  pkgs,
  inputs,
  config,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];
  programs.ags = {
    enable = true;
    configDir = ./config;
  };
  home.packages = with pkgs; [
    bun
    dart-sass
    fd
    swww
    matugen
  ];
}
