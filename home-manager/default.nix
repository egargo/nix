{ pkgs, inputs, ... }:

{
  imports = [
    ../config
  ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home = {
    username = "clint";
    homeDirectory = "/home/clint";
  };

  home.packages = with pkgs; [
    cargo rustc
    gcc
    ghostty
    gimp3
    gnumake
    go
    lua
    nodejs
    libreoffice
    python313
    postman
    stow
    vscode-fhs
    wget
  ];

  # xdg.configFile = {
  #   nvim = {
  #     source = ../config;
  #     recursive = true;
  #   };
  # };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;

    firefox = {
      enable = true;
      languagePacks = [ "en-US" ];
      profiles = {
        bee = {
          name = "bee";
          id = 0;
          extensions = {
            force = true;
            packages = with inputs.firefox-addons.packages."x86_64-linux"; [
              bitwarden
              ublock-origin
            ];
          };
          settings = {
            "browser.cache.disk.enable" = false;
            "browser.profiles.enabled" = true;
            "browser.tabs.closeWindowWithLastTab" = true;
            "browser.tabs.warnOnClose" = true;
            "extensions.autoDisableScopes" = 0;
            "media.ffmpeg.vaapi.enabled" = true;
            "media.av1.enabled" = false;
            "media.hardware-video-decoding.force-enabled" = true;
            "widget.wayland.opaque-region.enabled" = false;
          };
        };
      };
      policies = {
        DisableFirefoxAccounts = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableSetDesktopBackground = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        FirefoxHome = {
          Search = false;
          TopSites = false;
          SponsoredTopSites = false;
          Highlights = false;
          Pocket = false;
          SponsoredPocket = false;
          Snippets = false;
          Locked = true;
        };
        FirefoxSuggest = {
          WebSuggestions = false;
          SponsoredSuggestions = false;
          ImproveSuggest = false;
          Locked = true;
        };
        HardwareAcceleration = true;
        Homepage = {
          Locked = true;
          StartPage = "none";
        };
        HttpsOnlyMode = "force_enabled";
        NewTabPage = false;
        OfferToSaveLogins = false;
        OfferToSaveLoginsDefault = false;
        Permissions = {
          Notifications = {
            Allow = [ "https://www.facebook.com" ];
            BlockNewRequests = true;
          };
        };
        SanitizeOnShutdown = {
          Cache = true;
          Cookies = false;
          FormData = true;
          History = true;
          Sessions = false;
          SiteSettings = true;
          Locked = true;
        };
        SearchEngines = {
          PreventInstalls = true;
        };
        ShowHomeButton = false;
        TranslateEnabled = false;
      };
    };
    git = {
      enable = true;
      userEmail = "67180945+egargo@users.noreply.github.com";
      userName = "Clint Egargo";
      extraConfig = {
        branch.autosetuprebase = "always";
        github.user = "egargo";
        init.defaultBranch = "master";
      };
    };
    lazydocker.enable = true;
    lazygit.enable = true;
    neovim = {
      enable = true;
      extraConfig = builtins.readFile ../config/nvim/init.lua;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
    };
    tmux = {
      enable = true;
      keyMode = "vi";
      shortcut = "Space";
      terminal = "screen-256color";
    };
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
