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
    ./hardware.nix
    # Shared NixOS modules via self
    self.nixosModules.boot
    self.nixosModules.environment
    self.nixosModules.fonts
    self.nixosModules.sharedHardware
    self.nixosModules.i18n
    self.nixosModules.networking
    self.nixosModules.nix
    self.nixosModules.security
    self.nixosModules.services
    self.nixosModules.system
    self.nixosModules.time
    self.nixosModules.users

    # Features
    self.nixosModules.umbriel
    self.nixosModules.noctalia
    self.nixosModules.vicinae
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.hostName = hostname;
}
