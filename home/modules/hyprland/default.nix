{ inputs, ... }:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./binds.nix
    ./hyprland.nix
  ];
}
