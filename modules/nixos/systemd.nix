{ self, inputs, ... }:
{
  flake.nixosModules.systemd =
    { ... }:
    {
      systemd.services = {
        jellyfin = {
          enable = true;
          serviceConfig = {
            Wants = "";
            After = "";
          };
          wantedBy = [ "multi-user.target" ];
        };
      };
    };
}
