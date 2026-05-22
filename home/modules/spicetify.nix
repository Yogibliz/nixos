{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in
{
  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      hidePodcasts
      lastfm
      betterGenres
      history
      keyboardShortcut
    ];
    theme = spicePkgs.themes.dribbblishDynamic;
    # theme = spicePkgs.themes.bloom;
    # colorScheme = "violet";
  };
}
