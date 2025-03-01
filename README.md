# ❄️ NixOS

My NixOS configuration.

```bash
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade

sudo nixos-rebuild switch
nix-env --list-generations
nix-store --gc
sudo nix-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot
```
