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
        supportedFilesystems = [ "fuse" ];
        kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = [ "amdgpu.sg_display=0" ];
      };
    };
}
