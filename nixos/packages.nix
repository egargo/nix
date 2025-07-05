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
    shellAliases = {
      nfu = "nix flake update";
      hmb = "home-manager build switch --flake .";
      nxb = "nixos-rebuild switch --flake .";
      nsg = "nix-store --gc";
      ncg = "nix-collect-garbage -d";
      sbc = "/run/current-system/bin/switch-to-configuration boot";
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    brave
    ghostty
  ];

  services.teamviewer.enable = true;
}
