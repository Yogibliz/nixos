{ inputs, ... }:
{
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins
  ];
}
