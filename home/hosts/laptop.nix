{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    ",preferred, auto, 1.25"
  ];

  programs.niri.settings.outputs."*" = {
    scale = 1.25;
  };

  home.packages = with pkgs; [
    openssl_3_5
  ];
}
