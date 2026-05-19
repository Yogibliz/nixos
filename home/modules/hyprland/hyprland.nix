{
  config,
  pkgs,
  inputs,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [ inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3 ];

    extraConfig = ''
      source = ${config.xdg.configHome}/hypr/colors.conf
    '';

    settings = {
      debug = {
        vfr = true;
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
        "vicinae server"
        "hypridle"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      input = {
        kb_layout = "us,se";
        kb_options = "grp:win_space_toggle, caps:escape";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };
    };
  };
  home.file.".config/hypr/colors.conf" = {
    force = true;
    text = ''
      general {
          col.active_border = rgb(ffffff)
          col.inactive_border = rgb(444444)
      }
    '';
  };
}
