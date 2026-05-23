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
    self.nixosModules.xdg

    # Features
    self.nixosModules.homeManager
    self.nixosModules.hyprland
    self.nixosModules.noctalia
    self.nixosModules.steam
    self.nixosModules.jellyfin
    self.nixosModules.proton
    self.nixosModules.vicinae
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
    PROTON_ENABLE_WAYLAND = "1";
  };

  # Using the hostname passed down from mkHost
  networking.hostName = hostname;
}
