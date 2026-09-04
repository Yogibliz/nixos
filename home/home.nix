{ pkgs, ... }:
{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  nixpkgs.overlays = [
    (final: prev: {
      asymptote = prev.asymptote.override {
        python3 = prev.python312;
      };
    })
  ];

  home = {
    username = "iris";
    homeDirectory = "/home/iris";
    stateVersion = "26.05";

    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
