{ inputs, ... }:
{
  imports = [
    inputs.niri-flake.homeModules.niri
    ./niri.nix
    ./binds.nix
  ];
}
