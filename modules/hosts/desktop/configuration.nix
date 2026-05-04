{ self, inputs, ... }:
{
  flake.nixosModules.desktopConfiguration =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.desktopHardware

        # shared NixOS modules
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

        # features
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

      networking.hostName = "desktop";
    };
}
