{ inputs, system, ...}:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];
    profiles = {
      bee = {
        name = "bee";
        id = 0;
        extensions = {
          force = true;
          packages = with inputs.firefox-addons.packages.${system}; [
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
      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
        Exceptions = [
          "https://netflix.com"
        ];
      };
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
      NetworkPrediction = false;
      NewTabPage = false;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      Permissions = {
        Notifications = {
          Allow = [ "https://www.facebook.com" ];
          BlockNewRequests = true;
        };
      };
      PostQuantumKeyAgreementEnabled = true;
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
        Add = [
          {
            "Name" = "DuckDuckGo";
            "URLTemplate" = "https://duckduckgo.com/?q={searchTerms}&ia=web";
            "Method" = "GET";
            "IconURL" = "https://duckduckgo.com/favicon.ico";
            "Alias" = "ddg";
          }
        ];
        Default = "DuckDuckGo";
        PreventInstalls = true;
        Remove = [
          "Google"
          "Bing"
          "DuckDuckGo"
          "Ecosia"
        ];
      };
      SearchSuggestEnabled = false;
      ShowHomeButton = false;
      TranslateEnabled = false;
    };
  };
}
