{ self, inputs, ... }:
{
  flake.nixosModules.niri =
    { ... }:
    {
      imports = [ inputs.niri-flake.nixosModules.niri ];
      programs.niri.enable = true;
    };
}
