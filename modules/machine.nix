{ config, lib, pkgs, ... }:

{
  options.machine = {
    enable = lib.mkEnableOption "enables machine module";
  };

  config = lib.mkIf config.machine.enable {
    userName = "";
    hostName = "";
    systemArch = "";
  };
}
