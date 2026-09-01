{ pkgs, ... }:
{
  programs.umbriel.settings = {
    layout = {
      mode = "scrolling";
    };

    output = {
      "eDP-1" = {
        mode = "2880x1800@120";
        position = [
          0
          0
        ];
        scale = 1;
      };
    };
  };

  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "";
      mode = "preferred";
      position = "auto";
      scale = 1;
    }
  ];

  home.packages = with pkgs; [
    openssl_3_5
    libva-utils
    mission-center
    artix-games-launcher
  ];
}
