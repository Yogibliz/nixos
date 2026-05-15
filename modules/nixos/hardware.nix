{
  self,
  inputs,
  pkgs,
  ...
}:
{
  flake.nixosModules.sharedHardware = {
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
