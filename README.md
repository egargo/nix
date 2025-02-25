# ❄️ NixOS

My NixOS configuration.

```bash
nix-store --gc
sudo nix-channel --update
sudo nixos-rebuild switch
sudo nixos-rebuild boot
nix-env --list-generations
sudo nix-collect-garbage -d
sudo /run/current-system/bin/switch-to-configuration boot
```
