{ pkgs, ... }:
{
  # In waiting for hyprland v0.55
  # wayland.windowManager.hyprland.settings.monitor = [
  #   {
  #     output = "DP-2";
  #     mode = "2560x1440@60";
  #     position = "0x0";
  #     scale = 1;
  #   }
  #   {
  #     output = "DP-1";
  #     mode = "2560x1440@60";
  #     position = "2560x0";
  #     scale = 1;
  #   }
  # ];

  home.packages = with pkgs; [ ];
}
