{ inputs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "dev";
  home.homeDirectory = "/home/dev";

  programs = {
    home-manager.enable = true;
    firefox = {
      enable = false;
      languagePacks = [ "en-US" ];
      profiles = {
        bee = {
          name = "bee";
          id = 0;
          extensions = {
            force = true;
            packages = with inputs.firefox-addons; [ bitwarden ublock-origin ];
          };
          settings = {
            "browser.ml.enable" = false;
            "browser.ml.modelCacheMaxSizeBytes" = 0;
            "browser.ml.modelCacheTimeout" = 0;
            "browser.ml.modelHubRootUrl" = "";
            "browser.ml.modelHubUrlTemplate" = "";
            "browser.ml.chat.enabled" = false;
            "browser.ml.chat.shortcuts" = false;
            "browser.ml.chat.shortcuts.longPress" = 0;
            "browser.ml.chat.prompt.prefix" = "";
            "browser.ml.chat.prompts.0" = "";
            "browser.ml.chat.prompts.1" = "";
            "browser.ml.chat.prompts.2" = "";
            "browser.ml.chat.prompts.3" = "";
            "browser.tabs.closeWindowWithLastTab" = false;
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
        SanitizeOnShutdown = {
          Cache = true;
          Cookies = false;
          FormData = true;
          History = true;
          Sessions = false;
          SiteSettings = true;
          Locked = true;
        };
        SearchEngines = { PreventInstalls = true; };
        ShowHomeButton = false;
        TranslateEnabled = false;
      };
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
