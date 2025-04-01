# ❄️ NixOS

My NixOS configuration.

```bash
stow alacritty -t ~
stow nvim -t ~
stow tmux -t ~
stow starship -t ~

dotbox add .
```

```bash
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade

sudo nixos-rebuild switch
nix-env --list-generations
nix-store --gc
sudo nix-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot

# Flakes
nix flake update
sudo nixos-rebuild switch --flake .
```
