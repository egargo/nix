{ pkgs, ... }:

{
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

    screenfetch
  ];
}
