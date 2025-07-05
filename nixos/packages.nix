{ pkgs, ... }:

{
  programs.fzf.fuzzyCompletion = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    ohMyZsh = {
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
    syntaxHighlighting.enable = true;
    autosuggestions.enable = true;
  };

  systemPackages = with pkgs; [
    home-manager
    brave
    ghostty
  ];

  services.teamviewer.enable = true;
}
