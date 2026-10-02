{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;

  proton-pass-extension = inputs.vicinae.lib.${system}.mkRayCastExtension {
    name = "proton-pass";
    src =
      pkgs.fetchFromGitHub {
        owner = "raycast";
        repo = "extensions";
        rev = "7e67bdb0eb90315c17c07ebd696fd5abdc2a021a";
        hash = "sha256-GJHYhLBulHj4r/QUDqRGVLdxpGSXBW5mTJgXCnbJzhQ=";
        sparseCheckout = [ "extensions/proton-pass" ];
      }
      + "/extensions/proton-pass";
  };
in
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  programs.vicinae = {
    enable = true;
    package = pkgs.vicinae; # inputs.vicinae.packages.${system}.default;
    systemd = {
      enable = true;
      autoStart = true;
    };

    extensions =
      (with inputs.vicinae-extensions.packages.${system}; [
        nix
        fuzzy-files
      ])
      ++ [ proton-pass-extension ];
  };
}
