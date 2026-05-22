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
    configType = "lua";
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [ inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3 ];

    extraConfig = ''
      hl.plugin.load("${inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3}/lib/libhy3.so")
      local hy3 = hl.plugin.hy3
      local config_dir = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
      dofile(config_dir .. "/hypr/colors.lua")
    '';

    settings = {
      config = {
        general = {
          gaps_in = 5;
          gaps_out = 10;
          border_size = 4;
          layout = "hy3";
          "col.active_border" = {
            colors = [
              "rgb(ffffff)"
              "rgb(ffffff)"
            ];
            angle = 45;
          };
          "col.inactive_border" = "rgb(444444)";
        };

        decoration = {
          rounding = 12;
        };

        input = {
          kb_layout = "us,se";
          kb_options = "grp:win_space_toggle, caps:escape";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
          };
        };

        debug = {
          vfr = false;
        };
      };

      config.plugin.hy3 = {
        tabs = {
          height = 4;
          padding = 6;
          radius = 6;
        };
        autotile = {
          enable = true;
        };
      };

      workspace_rule = [
        {
          workspace = "1";
          monitor = "DP-1";
          default = true;
        }
        {
          workspace = "2";
          monitor = "DP-1";
        }
        {
          workspace = "3";
          monitor = "DP-2";
          default = true;
        }
        {
          workspace = "4";
          monitor = "DP-3";
          default = true;
        }
        {
          workspace = "5";
          monitor = "HDMI-A-1";
          default = true;
        }
      ];

      window_rule = [
        {
          match = {
            class = "steam";
          };
          float = true;
        }
        {
          match = {
            class = "steam";
            title = "Steam";
          };
          tile = true;
        }
      ];

      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("noctalia-shell")
              hl.exec_cmd("vicinae server")
              hl.exec_cmd("hypridle")
              hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
            end
          '')
        ];
      };
    };
  };
}
