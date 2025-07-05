# ❄️ NixOS

My NixOS configuration.


```bash
ln -s "$(pwd)/config/nvim" ~/.config; ln -s "$(pwd)/config/ghostty" ~/.config; ln -s "$(pwd)/config/.tmux.conf" ~
```

```bash
# Flakes
nix flake update
sudo nixos-rebuild switch --flake .
home-manager build switch --flake .

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
