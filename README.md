# NixOS Backup

To reproduce the NixOS setup simply run a few commands:
---

1. Clone and enter the repo to ~/dotfiles
```bash
git clone git@github.com:Yogibliz/nixos.git ~/dotfiles
```

2. Generate hardware config for this machine and fill it into the host hardware file

Each host needs a hardware file at `~/dotfiles/hosts/<host>/hardware.nix` with the following structure:

```nix
{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

   # ...
}
```

Run the generator to make sure one is available:

```bash
nixos-generate-config --show-hardware-config >> ~/dotfiles/hosts/$(hostanme)/hardware.nix
```

3. System rebuild (NixOS only — this does **not** apply Home Manager)
```bash
sudo nixos-rebuild switch --flake ~/dotfiles#<host>
```

4. Home Manager (separate `homeConfigurations` output — this is what provides programs, keybinds and dotfiles)
```bash
nix run home-manager/master -- switch -b backup --flake ~/dotfiles#iris@<host>
```

> `-b backup` is required on a machine with pre-existing dotfiles — activation aborts entirely if it would clobber an existing file like `~/.zshrc`, and renames it to `.backup` instead.
>
> Valid `<host>` values: `laptop`, `desktop`, `school`. Must match `hostname`.

5. Then for future updates use the aliases (available after step 4):
```bash
nrs   # nixos-rebuild switch
hms   # home-manager switch
```

## Enjoy!
