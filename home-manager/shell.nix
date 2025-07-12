{
  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      open = "xdg-open";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "command-not-found"
        "docker"
        "fzf"
        "git"
        "git-prompt"
        "gitignore"
        "golang"
        "rust"
        "safe-paste"
        "shrink-path"
        "vi-mode"
        "zsh-interactive-cd"
        "zsh-navigation-tools"
      ];
      theme = "robbyrussell";
    };
  };
}
