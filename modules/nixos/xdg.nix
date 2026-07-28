{ self, inputs, ... }:
{
  flake.nixosModules.xdg =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        config.common.default = [ "hyprland" ];
      };
    };
}
