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
    self.nixosModules.security
    self.nixosModules.services
    self.nixosModules.system
    self.nixosModules.time
    self.nixosModules.users
    self.nixosModules.xdg

    # Features
    self.nixosModules.hyprland
    self.nixosModules.samsungAudio
    self.nixosModules.steam
    self.nixosModules.vicinae
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
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

  environment.sessionVariables = {
    XWAYLAND_NO_GLAMOR = "1";
  };

  boot.kernelModules = [
    "samsung-galaxybook"
    "acpi_osi=Linux"
  ];

  services = {

    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "lock";
    };
  };
  networking.hostName = hostname;
}
