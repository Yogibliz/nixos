{ self, inputs, ... }:
{
  flake.nixosModules.sharedHardware =
    { pkgs, ... }:
    {
      hardware = {
        bluetooth.enable = true;
      };
    };
}
