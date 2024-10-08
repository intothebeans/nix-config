{ pkgs, ... }:
{
  home.packages = with pkgs; [
    oh-my-posh
  ];
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      size = 5000;
      save = 5000;
      path = "$HOME/.zsh_history";
      share = true;
      append = true;
      ignoreSpace = true;
      ignoreAllDups = true;
    };
    antidote = {
      enable = true;
      plugins = [
        "zsh-users/zsh-autosuggestions"
        "zsh-users/zsh-completions"
        "Aloxaf/fzf-tab"
        "getantidote/use-omz"
        "ohmyzsh/ohmyzsh path:plugins/command-not-found"
        "ohmyzsh/ohmyzsh path:plugins/colored-man-pages"
        "ohmyzsh/ohmyzsh path:plugins/rsync"
        "ohmyzsh/ohmyzsh path:plugins/docker"
	"ohmyzsh/ohmyzsh path:plugins/docker-compose"
      ];
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      config = "cd $HOME/nix-config";
      ls = "eza --color=always --icons=always --hyperlink -F";
      tree = "eza --color=always --icons=always -T";
      se = "sudoedit";
      tp = "trash put";
    };
    initExtra = ''
      HISTDUP=erase
      setopt hist_save_no_dups
      setopt hist_find_no_dups

      bindkey -e
      bindkey '^p' history-search-backward
      bindkey '^n' history-search-forward

      zstyle ':completion:*' menu no
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --color=always --icons=always -F $realpath'

      eval "$(oh-my-posh init zsh -c $HOME/.config/custom.omp.toml)"
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = [
      "--cmd cd"
    ];
  };
}
