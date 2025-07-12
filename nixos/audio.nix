{ pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
    settings = {
      General = {
        Experimental = false;
      };
    };
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # NOTE: branch:unstable
  services.pulseaudio.enable = false;

  # NOTE: branch:stable
  # hardware.pulseaudio = {
  #   enable = false;
  #   package = with pkgs; [ pulseaudioFull ];
  # };
}
