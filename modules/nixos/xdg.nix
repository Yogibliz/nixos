{ self, inputs, ... }:
{
  flake.nixosModules.xdg =
    { pkgs, ... }:
    {
      xdg.portal = {
        enable = true;
        config.common.default = [
          "umbriel"
          "gtk"
        ];
        extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
      };
    };
}
