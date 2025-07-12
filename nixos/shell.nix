{ pkgs, ... }:

{
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users.clint.shell = pkgs.zsh;
  };
}
