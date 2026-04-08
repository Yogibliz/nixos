{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    "DP-2, 1920x1080@60, 0x0, 1, transform, 3"
    "DP-1, 3440x1440@175, 1080x0, 1"
    "DP-3, 1920x1080@144, 4520x0, 1"
    "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"
  ];

  home.packages = with pkgs; [
  ];
}
