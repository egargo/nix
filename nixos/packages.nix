{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    home-manager
    brave
    ghostty
  ];

  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  programs.gnupg.agent.enable = true;

  services.teamviewer.enable = true;
}
