{ pkgs, ... }:
{
  programs.vim = with pkgs; {
    enable = true;
    plugins = [ vimPlugins.everforest ];
    settings = {
      background = "dark";
      expandtab = true;
      mouse = "a";
      smartcase = true;
      shiftwidth = 4;
      tabstop = 4;
      undodir = [ "$HOME/.vim/undodir" ];
      undofile = true;
    };
    extraConfig = ''
      syntax on
      colorscheme everforest

      set termguicolors
      set cursorline
      set noerrorbells
      set softtabstop=4
      set smartindent
      set nu
      set nowrap
      set noswapfile
      set nobackup
      set incserch

      set colorcolumn=80
      highlight ColorColumn ctermbg=0 guibg=lightgrey
    '';

  };
}
