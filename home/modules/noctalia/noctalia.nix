{
  self,
  inputs,
  pkgs,
  hostname,
  ...
}:
let
  configPath = "${self}/home/modules/noctalia/hosts/${hostname}/noctalia.json";
  noctalia-pkg = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
    inherit pkgs;
    settings = (builtins.fromJSON (builtins.readFile configPath)).settings;
  };
in
{
  home.packages = [ noctalia-pkg ];
}
