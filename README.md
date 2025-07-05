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


## SOPS

- standalone dev access key
```sh
mkdir -p ~/.config/sops/age

nix shell nixpkgs#age -c age-keygen -o ~/.config/sops/age/key.txt

Public key: age152qfu6qjyjtmwmsr9a0rzqgmwkr46kwzhejz7ts2l7pnahvdegrqd9hl4w


age136xxygzgflwdqk9kjawsf5aetkq9vycweddd2pghpxntdnase9kqte87qn
```
