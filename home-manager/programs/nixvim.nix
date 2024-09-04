{
  pkgs,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    colorscheme = "gruvbox";
    colorschemes.gruvbox.enable = true;
    clipboard.providers.wl-copy.enable = true;
  };
}
