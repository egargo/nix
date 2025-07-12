{
  programs.ghostty = {
    enable = true;
    settings = {
      app-notifications = false;
      command = "tmux attach || tmux";
      font-family = "Iosevka Nerd Font";
      font-size = 8;
      theme = "Kanagawa Wave";
    };
  };
}

