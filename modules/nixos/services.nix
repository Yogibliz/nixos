{ self, inputs, ... }:
{
  flake.nixosModules.services =
    { pkgs, ... }:
    {
      services = {
        blueman.enable = true;
        upower.enable = true;
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

        displayManager.ly = {
          enable = true;
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
