{ pkgs, ... }:

{
  # NOTE: Not necessarily GNOME, but IDK where to put this and I don't want to
  # create a new file just for these.
  i18n = {
    defaultLocale = "en_US.UTF-8";
      extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };
  };

  fonts.packages = with pkgs; [
    # NOTE: channel:stable
    # (nerdfonts.override {
    #   fonts = [ "Iosevka" ];
    # })

    # NOTE: channel:unstable
    nerd-fonts.iosevka
  ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.xserver = {
    enable = true;
    excludePackages = with pkgs; [ xterm ];
    videoDrivers = [ "nvidia" ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services = {
    desktopManager.gnome.enable = true;
      displayManager = {
        defaultSession = "gnome";
        gdm.enable = true;
    };
    gnome.gcr-ssh-agent.enable = true;
  };

  environment = {
    gnome.excludePackages = with pkgs; [
      epiphany
      geary
      gnome-connections
      gnome-contacts
      gnome-console
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-music
      gnome-photos
      gnome-software
      gnome-tour
      gnome-weather
      seahorse
      totem
      yelp
    ];
  };
}
