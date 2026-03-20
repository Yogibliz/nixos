# NixOS Backup

To reproduce the NixOS setup simply run a few commands:
---

1. Clone the repo to ~/dotfiles
```bash
git clone git@github.com:Yogibliz/nixos.git ~/dotfiles
```

2. Back up the current config setup as a fallback in case of failure
```bash
sudo mv /etc/nixos /etc/nixos.bak
mv ~/.config/home-manager ~/.config/home-manager.bak # If you have another home-manager setup
```

3. Symlink the dotfiles to their original placement
```bash
sudo ln -s ~/dotfiles/nixos/ /etc/
sudo nixos-generate-config # Generates a hardware-config matching current system.
ln -s ~/dotfiles/home-manager/ ~/.config/
```

4. Run home-manager and nixos-rebuild:
```bash
home-manager switch --flake .#iris # Build home-manager to get aliases, then restart terminal
nrs # Then rebuild nixos and flake with alias
```

### If there are any hyprland errors, relog to make sure plugins are loaded. `hyprctl dispatch exit`

## Enjoy!
