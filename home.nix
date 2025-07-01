{ pkgs, inputs, config, ... }:

{
  # imports = [
  #   inputs.nur.hmModules.nur
  # ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dev";
  home.homeDirectory = "/home/dev";

  home.packages = with pkgs; [
    nixfmt-rfc-style
    screenfetch
  ];

  programs = {
    home-manager.enable = true;

    firefox = {
      enable = true;
      languagePacks = [ "en-GB" ];
      profiles = {
        bee = {
          name = "bee";
          id = 0;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            bitwarden
            ublock-origin
          ];
        };
      };
    };
    nushell.enable = true;
  };

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
