{ self, inputs, ... }:
{
  flake.nixosModules.umbriel =
    { pkgs, ... }:
    {
      imports = [ inputs.umbriel.nixosModules.default ];
      programs.umbriel = {
        enable = true;
        package = inputs.umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
        portalPackage =
          inputs.umbriel.inputs.xdg-desktop-portal-umbriel.packages.${pkgs.stdenv.hostPlatform.system}.default;
      };
    };
}
