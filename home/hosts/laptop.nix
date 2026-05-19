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

  wayland.windowManager.hyprland.settings = {

    cursor = {
      no_hardware_cursors = true;
    };

    monitor = [
      ",highrr, auto, 1"
    ];

    xwayland = {
      enabled = true;
    };
  };

  home.packages = with pkgs; [
    openssl_3_5
    libva-utils
    mission-center
  ];
}
