{pkgs, ...}: {
  imports = [
    ./modules
    ./home-packages.nix
  ];

  home = {
    username = "iris";
    homeDirectory = "/home/iris";
    stateVersion = "25.11";

    pointerCursor = {
      gtk.enable = true;
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
