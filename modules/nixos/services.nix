{ self, inputs, ... }:
{
  flake.nixosModules.services =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      services = {
        blueman.enable = true;
        upower.enable = true;
        power-profiles-daemon.enable = true;
        udisks2.enable = true;

        xserver.xkb = {
          layout = "us";
          variant = "";
        };

        pipewire = {
          enable = true;
          alsa.enable = true;
          alsa.support32Bit = true;
          pulse.enable = true;
        };

        resolved = {
          enable = true;
          settings.Resolve.DNSSEC = "false";
        };

        displayManager.noctalia-greeter = {
          enable = true;

          settings = {
            output.name = "DP-2";
            cursor = {
              theme = "Bibata-Modern-Ice";
              size = 24;
            };
            keyboard = {
              layout = "us";
            };
            appearance = {
              password_style = "random";
            };
          };
        };

        udev.packages = with pkgs; [
          qmk-udev-rules
        ];

        udev.extraRules = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl"
        '';
      };
    };
}
