{ inputs, ... }:
{
  imports = [
    inputs.umbriel.homeModules.default
    ./umbriel.nix
    ./binds.nix
  ];
}
