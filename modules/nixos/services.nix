{ self, inputs, ... }:
{
  flake.nixosModules.services =
    { pkgs, ... }:
    {
      services = {
        blueman.enable = true;
        upower.enable = true;
        power-profiles-daemon.enable = true;

        xserver.xkb = {
          layout = "us";
          variant = "";
        };

        pipewire = {
          enable = true;
          alsa.enable = true;
          pulse.enable = true;
        };

        displayManager.ly = {
          enable = true;
        };

        resolved = {
          enable = true;
          settings.Resolve.DNSSEC = "false";
        };
      };
    };
}
