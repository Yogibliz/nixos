{ self, inputs, ... }:
{
  flake.nixosModules.networking = {
    services.tailscale.enable = true;

    networking = {
      networkmanager.enable = true;
      firewall = {
        checkReversePath = "loose";
        trustedInterfaces = [ "tailscale0" ];
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
