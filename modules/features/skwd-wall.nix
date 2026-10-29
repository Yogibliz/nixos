{ self, inputs, ... }:
{
  flake.nixosModules.skwdWall =
    { pkgs, ... }:
    {
      imports = [
        inputs.skwd-wall.nixosModules.default
      ];
      services.skwd-deck.enable = true;
    };
}
