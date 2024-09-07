{
  pkgs,
  config,
  ...
}: {
  programs.rofi.enable = true;
  home.file.".config/rofi" = {
    source = ./files;
    recursive = true;
  };
}
