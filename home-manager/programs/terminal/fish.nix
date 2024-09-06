{
  pkgs,
  config,
  ...
}: {
  programs.fish = {
    enable = true;
    shellInit = ''oh-my-posh init fish --config ${./. + "/custom.omp.toml"} | source'';
    shellAliases = {
      v = "vim";
      nv = "lvim";
      config = "cd $HOME/nix-config";
      ls = "eza --color=always --icons=always --hyperlink -F";
      tree = "eza --color=always --icons=always -T";
      se = "sudoedit";
    };
  };
  programs.fzf.enableFishIntegration = true;
  programs.zoxide.enableFishIntegration = true;
  programs.eza.enableFishIntegration = true;
  programs.oh-my-posh.enableFishIntegration = true;
}
