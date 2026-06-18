{ self, ... }:
{
  flake.nixosModules.jellyfin =
    { pkgs, ... }:
    {
      services.jellyfin = {
        enable = true;
        user = "iris";
      };
    };
}
