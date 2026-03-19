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
sudo ln -s ~/dotfiles/nixos/* /etc/nixos/
ln -s ~/dotfiles/home-manager/ ~/.config/
```

4. Enjoy!
