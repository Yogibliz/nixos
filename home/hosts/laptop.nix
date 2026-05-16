{ pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "";
      mode = "preferred";
      position = "auto";
      scale = 1.25;
    }
  ];

  home.packages = with pkgs; [
    openssl_3_5
    libva-utils
    mission-center
  ];
}
