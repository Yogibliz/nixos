{ self, inputs, ... }:
{
  flake.nixosModules.vicinae =
    { pkgs, ... }:
    {
      imports = [ inputs.vicinae.nixosModules.default ];
    };
}
