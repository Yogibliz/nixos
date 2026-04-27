{ self, inputs, ... }:
{
  flake.nixosModules.boot =
    { pkgs, ... }:
    {
      # Boot settings
      boot = {
        loader = {
          systemd-boot.enable = true;
          efi.canTouchEfiVariables = true;
          systemd-boot.configurationLimit = 3;
        };
        kernelPackages = pkgs.linuxPackages_6_19; # Stay on 6_19 for now, latest gives a lot of display/audio stuttering.
        kernelParams = [ "amdgpu.sg_display=0" ];
      };
    };
}
