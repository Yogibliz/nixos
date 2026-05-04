# NixOS Backup

To reproduce the NixOS setup simply run a few commands:
---

1. Clone and enter the repo to ~/dotfiles
```bash
git clone git@github.com:Yogibliz/nixos.git ~/dotfiles
cd ~/dotfiles
```

2. Generate hardware config for this machine and fill it into the host hardware file

Each host has a placeholder hardware file at `~/dotfiles/modules/hosts/<host>/hardware.nix` with the following structure:

```nix
{ self, inputs, ... }:
{
  flake.nixosModules.<host>Hardware =
    { config, lib, pkgs, modulesPath, ... }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      # --- FILL BELOW WITH GENERATED HARDWARE CONFIG ---

    };
}
```

Run the generator and copy the relevant fields into the inner block:

```bash
nixos-generate-config --show-hardware-config
```

The fields to copy over are things like `boot.initrd.availableKernelModules`, `boot.kernelModules`, `fileSystems`, `swapDevices` and `nixpkgs.hostPlatform`. These files are gitignored since they are machine-specific.

> **Note:** Some hosts require additional kernel patches or boot parameters to function correctly (e.g. the laptop requires specific modules to reach the login screen). Check the existing host files for reference.

3. First rebuild (picks up NixOS + Home Manager in one shot)
```bash
sudo nixos-rebuild switch --flake ~/dotfiles#<host>
```

4. Then for future updates use the alias:
```bash
nrs
```

### If there are any Hyprland errors, relog to make sure plugins are loaded: `hyprctl dispatch exit`

## Enjoy!
