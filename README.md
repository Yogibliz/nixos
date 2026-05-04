# NixOS Backup

To reproduce the NixOS setup simply run a few commands:
---

1. Clone and enter the repo to ~/dotfiles
```bash
git clone git@github.com:Yogibliz/nixos.git ~/dotfiles
```

2. Generate hardware config for this machine and fill it into the host hardware file

Each host has a placeholder hardware file at `~/dotfiles/hosts/<host>/hardware.nix` with the following structure:

```nix
{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # (CPU microcode settings may be here)

  # --- FILL BELOW WITH GENERATED HARDWARE CONFIG ---
}
```

Run the generator and copy the relevant fields into the inner block:

```bash
nixos-generate-config --show-hardware-config
```

The fields to copy over are things like `boot` `fileSystems`, `hardware` and `nixpkgs.hostPlatform`. These files are gitignored since they are machine-specific.

3. First rebuild (picks up NixOS + Home Manager + Flakes)
```bash
sudo nixos-rebuild switch --flake ~/dotfiles#<host>
```
After updating the `hardware.nix` file and rebuilding for the first time, make sure to run `git update-index --skip-worktree ~dotfiles/hosts/<host>/hardware.nix` so it's not updated on GitHub and the placeholder remains.

4. Then for future updates use the alias:
```bash
nrs
```

### If there are any Hyprland errors, relog to make sure plugins are loaded: `hyprctl dispatch exit`

## Enjoy!
