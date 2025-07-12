{ config, lib, pkgs, ... }:

{
  options.machine = {
    enable = lib.mkEnableOption "Enables machine module";

    user = {
      username = lib.mkOption {
        default = "Nix";
        type = lib.types.str;
        description = "Define user name";
      };

      description = lib.mkOption {
        default = "Nix";
        type = lib.types.str;
        description = "Define user description";
      };

      home = lib.mkOption {
        default = "/home/nix";
        type = lib.types.str;
        description = "Define user home";
      };

      groups = lib.mkOption {
        default = [ "wheel" ];
        type = lib.types.str;
        description = "Define user groups";
      };

      shell = lib.mkOption {
        default = pkgs.bash;
        type = lib.types.package;
        description = "Define user shell";
      };
    };

    hostname = lib.mkOption {
      default = "nixos";
      type = lib.types.str;
      description = "Define hostname";
    };

    arch = lib.mkOption {
      default = "x86_64-linux";
      type = lib.types.enum [ "x86_84-linux" ];
      description = "Define architecture";
    };

    nvidia = lib.mkOption {
      default = false;
      type = lib.types.bool;
      description = "Setup NVIDIA";
    };
  };

  config = lib.mkIf config.machine.enable {
    home = {
      username = lib.mkForce config.machine.user.username;
      homeDirectory = lib.mkForce config.machine.user.home;
    };

    users = {
      defaultUserShell = lib.mkForce config.machine.user.shell;
      users.${config.machine.user.username} = {
        isNormalUser = lib.mkForce true;
        home = lib.mkForce config.machine.user.home;
        description = lib.mkForce config.machine.user.description;
        # extraGroups = config.machine.user.groups ++ [ "wheel" ];
        shell = lib.mkForce config.machine.user.shell;
      };
    };

    networking.hostName = lib.mkForce config.machine.hostname;
  };
}
