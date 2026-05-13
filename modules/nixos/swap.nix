{ self, ... }:
{
  flake.nixosModules.swap = {
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 16384;
      }
    ];
  };
}
