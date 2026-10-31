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
    self.nixosModules.swap
    self.nixosModules.environment
    self.nixosModules.fonts
    self.nixosModules.sharedHardware
    self.nixosModules.i18n
    self.nixosModules.networking
    self.nixosModules.nix
    self.nixosModules.openssh
    self.nixosModules.security
    self.nixosModules.services
    self.nixosModules.system
    self.nixosModules.systemd
    self.nixosModules.time
    self.nixosModules.users
    self.nixosModules.xdg

    # Features
    self.nixosModules.jellyfin
    self.nixosModules.umbriel
    self.nixosModules.steam
    self.nixosModules.skwdWall
    self.nixosModules.sunshine
  ];

  services.gnome.gnome-keyring.enable = true;
  networking.interfaces.enp9s0.wakeOnLan.enable = true;

  programs = {
    ydotool.enable = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      libva
      libva-vdpau-driver
      libvdpau-va-gl
    ];
  };

  environment.sessionVariables = {
    AMD_VULKAN_ICD = "RADV";
    ENABLE_LAYER_MESA_ANTI_LAG = "1";
    RADV_PERFTEST = "sam, nircache, ngcc";
  };

  # Using the hostname passed down from mkHost
  networking.hostName = hostname;
}
