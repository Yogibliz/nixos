{ self, inputs, ... }:
{
  perSystem =
    { pkgs, self', ... }:
    {
      packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile ./noctalia.json)).settings;
      };
    };

  flake.nixosModules.noctalia =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia
      ];
    };
}
