{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    ",preferred, auto, 1.25"
  ];

  home.packages = with pkgs; [
  ];
}
