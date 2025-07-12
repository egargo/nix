{
  imports = [
    ./dconf.nix
    ./firefox.nix
    ./ghostty.nix
    ./git.nix
    ./nvim.nix
    ./packages.nix
    ./shell.nix
    ./starship.nix
    ./tmux.nix
    ./xdg.nix
  ];

  home = {
    username = "clint";
    homeDirectory = "/home/clint";
  };

  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.05";
}
