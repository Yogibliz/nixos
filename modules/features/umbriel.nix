{ self, inputs, ... }:
{
  flake.nixosModules.umbriel =
    { pkgs, ... }:
    {
      programs.umbriel = {
        enable = true;
        package = inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
        portalPackage =
          inputs.umbriel.inputs.xdg-desktop-portal-umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
}
