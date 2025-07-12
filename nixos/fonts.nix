{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    # NOTE: channel:stable
    # (nerdfonts.override {
    #   fonts = [ "Iosevka" ];
    # })

    # NOTE: channel:unstable
    nerd-fonts.iosevka
  ];
}
