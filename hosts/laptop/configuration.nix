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
    # shared NixOS modules via self
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
    self.nixosModules.time
    self.nixosModules.users

    # features
    self.nixosModules.hyprland
    self.nixosModules.noctalia
    self.nixosModules.homeManager
    self.nixosModules.samsungAudio
    self.nixosModules.proton
    self.nixosModules.steam
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.iris.imports = [
    "${self}/home/home.nix"
    "${self}/home/hosts/laptop.nix"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
    ];
  };

  networking.hostName = hostname;
}
