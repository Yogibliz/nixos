{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { ... }:
    {
      programs.niri = {
        enable = true;
      };
    };
}
