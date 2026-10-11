{ self, inputs, ... }:
{
  flake.nixosModules.systemd =
    { lib, ... }:
    {
      systemd = {
        services = {
          jellyfin = {
            wants = lib.mkForce [ ];
            after = lib.mkForce [ "network.target" ];
          };
        };
      };
    };
}
