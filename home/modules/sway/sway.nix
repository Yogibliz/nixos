{ pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    wrapperFeatures.gtk = true;

    checkConfig = false;

    # Base Sway config here.
    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      bars = [ ];

      input."*" = {
        xkb_layout = "us,se";
        xkb_options = "grp:win_space_toggle,caps:escape";
        natural_scroll = "disabled";
      };

      gaps = {
        inner = 5;
        outer = 10;
      };

      startup = [
        { command = "noctalia-shell"; }
        { command = "vicinae server"; }
      ];

      window = {
        border = 0;
        titlebar = false;
        commands = [
          {
            command = "floating enable";
            criteria = {
              app_id = "^steam$";
            };
          }
          {
            command = "floating disable";
            criteria = {
              app_id = "^steam$";
              title = "^Steam$";
            };
          }
        ];
      };
    };

    # Swayfx config here to seperate.
    extraConfig = ''
      corner_radius 10

      blur enable
      blur_passes 2
      blur_radius 5

      shadows enable
      shadow_blur_radius 15
      shadow_color #0000007F
    '';
  };
}
