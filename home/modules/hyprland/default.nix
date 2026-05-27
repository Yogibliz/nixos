{ inputs, ... }:
{
  imports = [
    # ./binds_hyprlang.nix
    # ./hyprland_hyprlang.nix
    ./binds_lua.nix
    ./hyprland_lua.nix
  ];
}
