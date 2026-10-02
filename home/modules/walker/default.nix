{ inputs, ... }:
{
  imports = [
    inputs.walker.homeManagerModules.default
    ./walker.nix
  ];
}
