# ── Hyprland ──────────────────────────────────────────────
{
  pkgs,
  hyprland,
  hy3,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    package = hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

    plugins = [
      hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3
    ];

    settings = {
      # Monitor config
      monitor = [
        # School
        "DP-2, 2540x1440@60, 2540x0, 1"
        "DP-1, 2540x1440@60, auto, 1"

        # Home
        # "DP-2, 1920x1080@60, 0x0, 1, transform, 3"
        # "DP-1, 3440x1440@175, 1080x, 1"
        # "DP-3, 1920x1080@144, 4520x0, 1"
        # "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"

        # Laptop
        # ",preferred, auto, 1.5"
      ];

      # Window Rules
      windowrule = [
        "match:class steam, float 1"
        "match:class steam, match:title Steam, tile 1"
      ];

      # App rounding
      decoration = {
        rounding = 12;
      };

      # General
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
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

      # Leader Button
      "$leader" = "SUPER";

      # Basic apps to set
      "$terminal" = "ghostty";
      "$browser" = "firefox";
      "$hyprshot" = "hyprshot -m region --clipboard-only -s";

      exec-once = [
        "ashell"
        "hyprshell -run"
      ];

      input = {
        kb_layout = "us,se";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      # Basic keybinds
      bind = [
        "$leader, escape, exec, hyprlock"
        "$leader, T, exec, $terminal"
        "$leader, Q, killactive"
        "$leader, B, exec, $browser"
        "$leader, F, fullscreen"
        "$leader, V, togglefloating"
        "$leader SHIFT, S, exec, $hyprshot"

        # Move focus
        "$leader, H, hy3:movefocus, l"
        "$leader, L, hy3:movefocus, r"
        "$leader, K, hy3:movefocus, u"
        "$leader, J, hy3:movefocus, d"

        # Move windows
        "$leader SHIFT, H, hy3:movewindow, l"
        "$leader SHIFT, L, hy3:movewindow, r"
        "$leader SHIFT, K, hy3:movewindow, u"
        "$leader SHIFT, J, hy3:movewindow, d"

        # Group windows — h = horizontal split, v = vertical split, tab = tabbed
        "$leader, G, hy3:makegroup, h"
        "$leader SHIFT, G, hy3:makegroup, v"
        "$leader, W, hy3:makegroup, tab"

        # Move focus in/out of groups
        "$leader, A, hy3:changefocus, raise"
        "$leader SHIFT, A, hy3:changefocus, lower"

        # Workspaces
        "$leader, 1, workspace, 1"
        "$leader, 2, workspace, 2"
        "$leader, 3, workspace, 3"
        "$leader, 4, workspace, 4"
        "$leader, 5, workspace, 5"

        # Move window to workspace
        "$leader SHIFT, 1, movetoworkspace, 1"
        "$leader SHIFT, 2, movetoworkspace, 2"
        "$leader SHIFT, 3, movetoworkspace, 3"
        "$leader SHIFT, 4, movetoworkspace, 4"
        "$leader SHIFT, 5, movetoworkspace, 5"
      ];

      bindr = [
      ];

      bindm = [
        "$leader, mouse:272, movewindow"
        "$leader, mouse:273, resizewindow"
      ];
    };
  };

  # Useful companion packages
  home.packages = with pkgs; [
    ghostty # terminal
    wl-clipboard # clipboard
    hyprpaper # wallpaper
    hyprlock # screen lock
    hypridle # idle manager
    hyprshot # screenshot tool
  ];

  # Alt-tabbing & Launcher
  programs.hyprshell = {
    enable = true;
    settings = {
      windows = {
        enable = true;
        scale = 8.0;

        overview = {
          enable = true;
          key = "Super_L";
          modifier = "super";
          launcher = {
            max_items = 6;
            default_terminal = "ghostty";
            plugins = {
              applications.enable = true;
              calc.enable = true;
              terminal.enable = true;
            };
          };
        };
        switch = {
          enable = true;
          key = "Tab";
          modifier = "alt";
          filter_by = ["current_monitor"];
        };

        switch_2 = {
          enable = true;
          key = "Tab";
          modifier = "alt"; # hyprshell detects shift automatically for reverse
          filter_by = ["current_monitor"];
        };
      };
    };
  };

  # Idle management
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock"; # Prevent duplicate hyprlock instances
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };

      listener = [
        {
          timeout = 300; # 5 minutes — lock screen
          on-timeout = "hyprlock";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 360; # 6 minutes — turn off displays
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
