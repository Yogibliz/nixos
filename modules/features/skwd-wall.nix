{ self, inputs, ... }:
{
  flake.nixosModules.skwdWall =
    { pkgs, ... }:
    let
      skwd = inputs.skwd-wall.packages.${pkgs.stdenv.hostPlatform.system};
    in
    {
      imports = [
        inputs.skwd-wall.nixosModules.default
      ];

      services.skwd-deck = {
        enable = true;
        extraPackages = [ skwd.skwd-deck-steamworks ];
      };
    };
}
