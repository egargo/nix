# ❄️ NixOS Configurations

My NixOS configurations.


```bash
ln -s "$(pwd)/config/nvim" ~/.config; ln -s "$(pwd)/config/ghostty" ~/.config; ln -s "$(pwd)/config/.tmux.conf" ~
```

```bash
# Flakes
nfu      # nix flake update
hmb      # home-manager build switch --flake .
sudo nxb # nixos-rebuild switch --flake .
nsg      # nix-store --gc
sudo ncg # nix-collect-garbage -d
sudo sbc # /run/current-system/bin/switch-to-configuration boot


# Manual
sudo nix-channel --update
sudo nixos-rebuild switch --upgrade
sudo nixos-rebuild switch
```
