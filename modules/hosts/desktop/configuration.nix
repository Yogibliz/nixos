{ self, inputs, ... }:
{
  flake.nixosModules.desktopConfiguration =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.desktopHardware

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
        self.nixosModules.homeManager
        self.nixosModules.hyprland
        self.nixosModules.noctalia
        self.nixosModules.steam
        self.nixosModules.jellyfin
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      home-manager.users.iris.imports = [
        "${self}/home/home.nix"
        "${self}/home/hosts/desktop.nix"
      ];

      networking.hostName = "desktop";

      fileSystems."/mnt/games" = {
        device = "/dev/disk/by-uuid/c82bd535-419a-4d80-92c1-22f3c4b88eb4";
        fsType = "ext4";
        options = [
          "defaults"
          "nofail"
        ];
      };

      fileSystems."/mnt/media" = {
        device = "/dev/disk/by-uuid/4c4cf374-ebe1-4d9e-8c42-e1b0fdc5d764";
        fsType = "ext4";
        options = [
          "defaults"
          "nofail"
        ];
      };
    };
}
