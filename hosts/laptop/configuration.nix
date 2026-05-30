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
    self.nixosModules.xdg

    # features
    self.nixosModules.hyprland
    self.nixosModules.noctalia
    self.nixosModules.homeManager
    self.nixosModules.samsungAudio
    self.nixosModules.proton
    self.nixosModules.steam
    self.nixosModules.vicinae
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

  environment.sessionVariables = {
    XWAYLAND_NO_GLAMOR = "1";
  };

  boot.kernelModules = [
    "samsung-galaxybook"
    "acpi_osi=Linux"
  ];

  services = {

    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "powersave";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        # This controls the actual snappiness of Core Ultra chips
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      };
    };

    logind.settings.Login = {
      HandleLidSwitch = "suspend";
      HandleLidSwitchExternalPower = "lock";
    };
  };
  networking.hostName = hostname;
}
