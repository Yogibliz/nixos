{ self, inputs, ... }:
{
  flake.nixosModules.security = {
    security.rtkit.enable = true;
  };
}
