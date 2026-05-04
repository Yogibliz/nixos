{
  self,
  inputs,
  hostname,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    # You can now import the hardware file directly using a relative path!
    ./hardware.nix

    # You still load your shared modules via `self` thanks to import-tree
    self.nixosModules.boot
    self.nixosModules.swap
    self.nixosModules.environment
    self.nixosModules.fonts
    self.nixosModules.sharedHardware
    self.nixosModules.i18n
    self.nixosModules.networking
    self.nixosModules.nix
    self.nixosModules.security
    self.nixosModules.services
    self.nixosModules.system
    self.nixosModules.systemd
    self.nixosModules.time
    self.nixosModules.users

    # Features
    self.nixosModules.homeManager
    self.nixosModules.hyprland
    self.nixosModules.ollama
    self.nixosModules.noctalia
    self.nixosModules.steam
    self.nixosModules.jellyfin
    self.nixosModules.proton
  ];

  services.gnome.gnome-keyring.enable = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.iris.imports = [
    "${self}/home/home.nix"
    "${self}/home/hosts/desktop.nix"
  ];

  # Using the hostname passed down from mkHost
  networking.hostName = hostname;
}
