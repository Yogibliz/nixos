{ self, inputs, ... }:
{
  flake.nixosModules.xdg =
    { pkgs, ... }:
    {
      xdg.mimeApps = {
        enable = true;
        defaultApplications = {
          "image/gif" = "imv.desktop";
        };
      };
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
