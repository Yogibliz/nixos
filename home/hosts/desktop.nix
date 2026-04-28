{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-2, 1920x1080@144, 0x0, 1, transform, 3"
    "DP-1, 3440x1440@175, 1080x0, 1"
    "DP-3, 1920x1080@144, 4520x0, 1"
    "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"
  ];

  programs.niri.settings.outputs = {
    "DP-2" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 144.0;
      };
      position = {
        x = 0;
        y = 0;
      };
      scale = 1.0;
      transform.rotation = 270;
    };
    "DP-1" = {
      mode = {
        width = 3440;
        height = 1440;
        refresh = 175.0;
      };
      position = {
        x = 1080;
        y = 0;
      };
      scale = 1.0;
    };
    "DP-3" = {
      mode = {
        width = 1920;
        height = 1080;
        refresh = 144.0;
      };
      position = {
        x = 4520;
        y = 0;
      };
      scale = 1.0;
    };
    "HDMI-A-1" = {
      mode = {
        width = 3840;
        height = 2160;
        refresh = 120.0;
      };
      position = {
        x = 6440;
        y = 0;
      };
      scale = 1.5;
    };
  };

  home.packages = with pkgs; [
    openssl_3_5
  ];
}
