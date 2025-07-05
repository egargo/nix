{ pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.zsh;
    users.clint = {
      isNormalUser = true;
      home = "/home/clint";
      description = "Clint";
      extraGroups = [
        "docker"
        "jackaudio"
        "networkmanager"
        "video"
        "wheel"
      ];
      shell = pkgs.zsh;
    };
  };

}
