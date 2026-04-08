{ self, inputs, ... }:
{
  flake.nixosModules.networking = {
    networking = {
      networkmanager.enable = true;
      firewall.checkReversePath = "loose";
    };
  };
}
