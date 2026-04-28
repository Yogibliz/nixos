{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-1, 2540x1440@60, 2540x0, 1"
    "DP-2, 2540x1440@60, 0x0, 1"
  ];

  programs.niri.settings.outputs = {
    "DP-1" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 60.0;
      };
      position = {
        x = 2560;
        y = 0;
      };
      scale = 1.0;
    };
    "DP-2" = {
      mode = {
        width = 2560;
        height = 1440;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1.0;
    };
  };

  home.packages = with pkgs; [ ];
}
