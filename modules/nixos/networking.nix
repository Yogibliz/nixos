{ self, inputs, ... }:
{
  flake.nixosModules.networking = {
    networking = {
      networkmanager.enable = true;
      firewall = {
        checkReversePath = "loose";
        allowedTCPPorts = [
          3000
          11434
          27036
          27037
        ];
        allowedUDPPorts = [
          27031
          27036
        ];
      };
    };
  };
}
