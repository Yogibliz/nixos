{ self, inputs, ... }:
{
  flake.nixosModules.sharedHardware =
    { pkgs, ... }:
    {
      hardware = {
        bluetooth.enable = true;
        graphics = {
          enable = true;
          enable32Bit = true;
          extraPackages = with pkgs; [
            libva
            vaapiVdpau
            libvdpau-va-gl
          ];
        };
      };
    };
}
