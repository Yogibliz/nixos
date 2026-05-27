{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    plugins = [ inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3 ];

    settings = {
      debug = {
        vfr = false;
      };

      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-2, default:true"
        "4, monitor:DP-3, default:true"
        "5, monitor:HDMI-A-1, default:true"
      ];

      windowrule = [
        "match:class steam, float 1"
        "match:class steam, match:title Steam, tile 1"
      ];

      decoration = {
        rounding = 12;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 4;
        layout = "hy3";
      };

      plugin.hy3 = {
        tabs = {
          height = 4;
          padding = 6;
          rounding = 3;
        };

        autotile = {
          enable = true;
          ephemeral_groups = true;
        };
      };

      exec-once = [
        "noctalia-shell"
        "hypridle"
      ];

      input = {
        kb_layout = "us,se";
        kb_options = "grp:win_space_toggle, caps:escape";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };
    };
  };
}
