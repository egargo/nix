{
  dconf.settings = {
    "org/gnome/Snapshot" = {
      is-maximized=false;
      play-shutter-sound=false;
      show-composition-guidelines=true;
    };

    "org/gnome/TextEditor" = {
      tab-width = "uint32 4";
    };

    "org/gnome/boxes" = {
      first-run = false;
      view = "icon-view";
      window-maximized = true;
    };

    "org/gnome/calculator" = {
      accuracy = 9;
      angle-units = "degrees";
      base = 10;
      button-mode = "programming";
      number-format = "automatic";
      show-thousands = false;
      show-zeroes = false;
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-maximized = false;
      word-size = 64;
    };

    "org/gnome/calendar" = {
      active-view = "month";
    };

    "org/gnome/control-center" = {
      last-panel="system";
    };

    "org/gnome/desktop/a11y/keyboard" = {
      bouncekeys-enable = false;
      enable = false;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/break-reminders" = {
      selected-breaks = "@as []";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = "uint32 300";
      interval-seconds = "uint32 1800";
      play-sound = true;
    };

    "org/gnome/desktop/input-sources" = {
      sources = ["xkb" "us"];
      xkb-options = ["terminate:ctrl_alt_bksp"];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      color-scheme = "prefer-dark";
      cursor-blink = true;
      cursor-size = 24;
      show-battery-percentage = true;
      scaling-factor = "uint32 1";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = false;
      repeat = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      left-handed = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screen-time-limits" = {
      daily-limit-enabled = false;
      daily-limit-seconds = "uint32 60";
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      primary-color = "#000000000000";
      secondary-color = "#000000000000";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = "['org.gnome.Nautilus.desktop', 'org.gnome.Characters.desktop', 'org.gnome.clocks.desktop', 'org.gnome.Calendar.desktop']";
      sort-order = "['org.gnome.Settings.desktop', 'org.gnome.Contacts.desktop', 'org.gnome.Nautilus.desktop']";
    };

    "org/gnome/desktop/session" = {
      idle-delay = "uint32 0";
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
      event-sounds = false;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      switch-applications = "@as []";
      switch-applications-backward = "@as []";
      switch-windows = [ "<Alt>Tab" ];
      switch-windows-backward = [ "<Shift><Alt>Tab"];
    };

    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 3;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = false;
      experimental-features = [ "scale-monitor-framebuffer" ];
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/nautilus/list-view" = {
      default-zoom-level = "small";
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = false;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 0.0;
      night-light-schedule-to = 0.0;
      night-light-temperature = "uint32 1700";
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>b";
      command = "firefox";
      name = "Browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>f";
      command = "nautilus";
      name = "Files";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "Terminal";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "interactive";
      power-saver-profile-on-low-battery = true;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-type = "nothing";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "com.mitchellh.ghostty.desktop"
        "firefox.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/virt-manager/virt-manager" = {
      manager-window-height = 550;
      manager-window-width = 550;
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/console" = {
      grab-keys = "65507,65505,76";
    };

    "org/virt-manager/virt-manager/new-vm" = {
      graphics-type = "system";
    };
  };
}



