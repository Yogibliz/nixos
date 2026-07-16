{ self, inputs, ... }:
{
  flake.nixosModules.xdg =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        extraPortals = [
          pkgs.xdg-desktop-portal-hyprland
        ];
        config.common.default = [ "hyprland" ];
      };
    };
}
