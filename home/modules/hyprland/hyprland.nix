{
  config,
  pkgs,
  inputs,
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
        local config_dir = os.getenv("XDG_CONFIG_HOME") or (os.getenv("HOME") .. "/.config")
        dofile(config_dir .. "/hypr/colors.lua")

      settings = {
        -- General config
        hl.config({
          general = {
            gaps_in     = 5,
            gaps_out    = 10,
            border_size = 4,
            layout      = "hy3",
            ["col.active_border"] = { colors = { "rgb(ffffff)", "rgb(ffffff)" }, angle = 45 },
            ["col.inactive_border"] = "rgb(444444)",
          },
          decoration = {
            rounding = 12,
          },
          input = {
            kb_layout  = "us,se",
            kb_options = "grp:win_space_toggle, caps:escape",
            follow_mouse = 1,
            touchpad = {
              natural_scroll = true,
            },
          },
          debug = {
            vfr = false,
          },
        })

        -- hy3 plugin config
        hl.config({
          plugin = {
            hy3 = {
              tabs = {
                height = 4,
                padding = 6,
                radius = 6,
              },
              autotile = {
                enable = true,
              },
            },
          },
        })

        -- Workspace rules
        hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
        hl.workspace_rule({ workspace = "2", monitor = "DP-1" })
        hl.workspace_rule({ workspace = "3", monitor = "DP-2", default = true })
        hl.workspace_rule({ workspace = "4", monitor = "DP-3", default = true })
        hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-1", default = true })

        -- Window rules
        hl.window_rule({ match = { class = "steam" },                       float = true })
        hl.window_rule({ match = { class = "steam", title = "Steam" },      tile  = true })

        -- Autostart
        hl.on("hyprland.start", function()
          hl.exec_cmd("noctalia-shell")
          hl.exec_cmd("vicinae server")
          hl.exec_cmd("hypridle")
          hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
        end)    '';

  };
}
