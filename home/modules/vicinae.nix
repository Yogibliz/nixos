{ pkgs, inputs, ... }:
{
  programs.vicinae = {
    enable = true;
    package = inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default;
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      bluetooth
      fuzzy-files
      nix
      player-pilot
      power-profile
      process-manager
      protondb-search
    ];
    settings = {

    };
  };
}
