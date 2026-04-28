{ self, inputs, ... }:
{
  flake.nixosModules.laptopConfiguration =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.laptopHardware

        # shared NixOS modules
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

        # features
        self.nixosModules.hyprland
        self.nixosModules.niri
        self.nixosModules.noctalia
        self.nixosModules.homeManager
        self.nixosModules.samsungAudio
        self.nixosModules.proton
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      home-manager.users.iris.imports = [
        "${self}/home/home.nix"
        "${self}/home/hosts/laptop.nix"
      ];

      networking.hostName = "laptop";

    };
}
