{
  programs.git = {
    enable = true;
    userEmail = "67180945+egargo@users.noreply.github.com";
    userName = "Clint Egargo";
    extraConfig = {
      branch.autosetuprebase = "always";
      github.user = "egargo";
      init.defaultBranch = "master";
    };
  };
}
