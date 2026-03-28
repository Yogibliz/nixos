# NixOS Backup

To reproduce the NixOS setup simply run a few commands:
---

1. Clone and enter the repo to ~/dotfiles
```bash
git clone git@github.com:Yogibliz/nixos.git ~/dotfiles
cd ~/dotfiles
```

2. Generate hardware config for this machine (replace "\<host\>" with desktop/laptop/school)
```bash
nixos-generate-config --show-hardware-config > nixos/hosts/<host>/hardware-configuration.nix
```

3. First rebuild (picks up NixOS + Home Manager in one shot)
```bash
sudo nixos-rebuild switch --flake ~/dotfiles#<host>
```

4. Then for future updates use alias:
```bash
nrs
```

### If there are any hyprland errors, relog to make sure plugins are loaded. `hyprctl dispatch exit`

## Enjoy!
