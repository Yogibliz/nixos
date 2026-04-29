{ self, ... }:
{
  flake.nixosModules.swap = {
    swapDevice = [
      {
        device = "/var/lib/swapfile";
        size = 8192;
      }
    ];
  };
}
