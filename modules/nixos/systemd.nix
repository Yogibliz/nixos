{ self, inputs, ... }:
{
  flake.nixosModules.systemd =
    { lib, ... }:
    {
      systemd.services = {
        NetworkManager-wait-online.enable = false;
        jellyfin = {
          wants = lib.mkForce [ ];
          after = lib.mkForce [ "network.target" ];
        };
      };
    };
}
