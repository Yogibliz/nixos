{ pkgs, ... }:
{
  imports = [
    ./modules
  ];

  home = {
    username = "iris";
    homeDirectory = "/home/iris";
    stateVersion = "25.11";

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

  services.udiskie = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
