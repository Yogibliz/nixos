{ pkgs, ... }:
{
  programs.umbriel.settings = {
    layout = {
      mode = "dwindle";
    };

    output = {
      "DP-1" = {
        mode = "2560x1440@60";
        position = [
          2560
          0
        ];
        scale = 1;
      };
      "DP-2" = {
        mode = "2560x1440@60";
        position = [
          0
          0
        ];
        scale = 1;
      };

    };
  };

  home.packages = with pkgs; [ ];
}
