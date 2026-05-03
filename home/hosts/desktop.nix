{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-2, 1920x1080@144, 0x0, 1, transform, 3"
    "DP-1, 3440x1440@175, 1080x0, 1"
    "DP-3, 1920x1080@144, 4520x0, 1"
    "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"
  ];

  wayland.windowManager.sway.config.output = {
    "DP-2" = {
      mode = "1920x1080@144Hz";
      position = "0 0";
      transform = "90";
    };
    "DP-1" = {
      mode = "3440x1440@175Hz";
      position = "1080 0";
    };
    "DP-3" = {
      mode = "1920x1080@144Hz";
      position = "4520 0";
    };
    "HDMI-A-1" = {
      mode = "3840x2160@120Hz";
      position = "6440 0";
      scale = "1.5";
    };
  };

  home.packages = with pkgs; [
    openssl_3_5
  ];
}
