{ self, inputs, ... }:
{
  flake.nixosModules.schoolConfiguration =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.schoolHardware

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
        self.nixosModules.noctalia

        # home manager
        inputs.home-manager.nixosModules.home-manager
      ];

      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      networking.hostName = "school";

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

      programs.gamescope = {
        enable = true;
        capSysNice = true;
      };

      programs.steam = {
        enable = true;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs self; };
        users.iris.imports = [
          "${self}/home/home.nix"
          "${self}/home/hosts/school.nix"
        ];
      };

    };
}
