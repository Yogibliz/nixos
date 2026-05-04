{ self, inputs, ... }:

{
  flake.nixosModules.noctalia =
    { pkgs, hostname, ... }:
    let
      configPath = "${self}/modules/features/noctalia/hosts/${hostname}/noctalia.json";

      noctalia-pkg = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile configPath)).settings;
      };
    in
    {
      environment.systemPackages = [
        noctalia-pkg
      ];
    };
}
