{ pkgs, ... }:
{
  # In waiting for hyprland v0.55
  # wayland.windowManager.hyprland.settings.monitor = [
  #   {
  #     output = "";
  #     mode = "preferred";
  #     position = "auto";
  #     scale = 1.25;
  #   }
  # ];

  wayland.windowManager.hyprland.settings.monitor = [
    ",preferred, auto, 1.25"
  ];

  home.packages = with pkgs; [
    openssl_3_5
    mission-center
  ];
}
