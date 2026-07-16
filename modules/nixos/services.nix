{ self, inputs, ... }:
{
  flake.nixosModules.services =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia-greeter.nixosModules.default
      ];

      programs.noctalia-greeter = {
        enable = true;
        package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

        settings = {
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

        udev.packages = with pkgs; [
          qmk-udev-rules
        ];

        udev.extraRules = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="plugdev", TAG+="uaccess", TAG+="udev-acl"
        '';
      };
    };
}
