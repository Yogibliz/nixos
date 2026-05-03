{ self, inputs, ... }:
{
  flake.nixosModules.sway =
    { ... }:
    {
      programs.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
      };
    };
}
