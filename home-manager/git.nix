{
  programs.git = {
    enable = true;
    userEmail = "67180945+egargo@users.noreply.github.com";
    userName = "Clint Egargo";
    signing = {
      format = "ssh";
      key = "/home/clint/.ssh/git.personal.pub";
      signByDefault = true;
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      core = {
        autocrlf = "input";
        editor = "nvim";
      };
      github.user = "egargo";
      init.defaultBranch = "master";
      pull.rebase = "interactive";
      push.autoSetupRemote = true;
    };
  };

  programs.lazygit.enable = true;
}
