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

          extraConfig.pipewire."99-clock-rates" = {
            "context.properties" = {
              "default.clock.rate" = 44100;
              "default.clock.allowed-rates" = [
                44100
                48000
                88200
                96000
                176400
                192000
              ];
            };
          };

          wireplumber.extraConfig."99-volume-fix" = {
            "monitor.alsa.rules" = [
              {
                matches = [
                  {
                    "node.name" = "~alsa_output.*Scarlett.*";
                  }
                ];
                actions = {
                  update-props = {
                    # No more eardrums blowing up due to tidal (SONE) bit-perfect
                    "volume.max" = 0.5;
                    "api.alsa.soft-volume" = true;
                    "channelmix.upmix" = false;
                  };
                };
              }
            ];
          };
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
          ddcutil
          qmk-udev-rules
        ];

        udev.extraRules = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl"
          KERNEL=="hidraw*", ATTRS{idVendor}=="056a", TAG+="uaccess"
          SUBSYSTEM=="usb", ATTR{idVendor}=="0ac3", TAG+="uaccess"
        '';
      };
    };
}
