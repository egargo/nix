# ❄️ NixOS

My NixOS configuration.


```bash
stow nvim -t ~
stow tmux -t ~
```

```bash
# Flakes
nix flake update
sudo nixos-rebuild switch --flake .
home-manager build switch --flake .

sudo nix-store --gc && sudo nix-collect-garbage -d


# Manual
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
sudo nixos-rebuild switch

# Clean up
nix-env --list-generations
nix-store --gc
sudo nix-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot
```
