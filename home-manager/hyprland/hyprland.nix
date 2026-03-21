{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    plugins = [
      inputs.hy3.packages.${pkgs.stdenv.hostPlatform.system}.hy3
    ];

    settings = {
      # Monitors are set per host in home-manager/hosts/*.nix

      windowrule = [
        "match:class steam, float 1"
        "match:class steam, match:title Steam, tile 1"
      ];

      decoration.rounding = 12;

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

      "$leader" = "SUPER";
      "$terminal" = "ghostty";
      "$browser" = "firefox";
      "$hyprshot" = "hyprshot -m region --clipboard-only -s";

      exec-once = [
        "ashell"
        "hyprshell run"
      ];

      input = {
        kb_layout = "us,se";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      bind =
        [
          "$leader, escape, exec, hyprlock"
          "$leader, T, exec, $terminal"
          "$leader, Q, killactive"
          "$leader, B, exec, $browser"
          "$leader, F, fullscreen"
          "$leader, V, togglefloating"
          "$leader SHIFT, S, exec, $hyprshot"

          "$leader, H, hy3:movefocus, l"
          "$leader, L, hy3:movefocus, r"
          "$leader, K, hy3:movefocus, u"
          "$leader, J, hy3:movefocus, d"

          "$leader SHIFT, H, hy3:movewindow, l"
          "$leader SHIFT, L, hy3:movewindow, r"
          "$leader SHIFT, K, hy3:movewindow, u"
          "$leader SHIFT, J, hy3:movewindow, d"

          "$leader, G, hy3:makegroup, h"
          "$leader SHIFT, G, hy3:makegroup, v"
          "$leader, W, hy3:makegroup, tab"

          "$leader, A, hy3:changefocus, raise"
          "$leader SHIFT, A, hy3:changefocus, lower"
        ]
        ++ builtins.concatMap (
          n: let
            ws = toString n;
          in [
            "$leader, ${ws}, workspace, ${ws}"
            "$leader SHIFT, ${ws}, movetoworkspace, ${ws}"
          ]
        ) (builtins.genList (x: x + 1) 5);

      bindm = [
        "$leader, mouse:272, movewindow"
        "$leader, mouse:273, resizewindow"
      ];
    };
  };

  home.packages = with pkgs; [
    ghostty
    wl-clipboard
    hyprpaper
    hyprlock
    hypridle
    hyprshot
  ];

  programs.hyprshell = {
    enable = true;
    settings.windows = {
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
        modifier = "alt";
        filter_by = ["current_monitor"];
      };
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
      };
      listener = [
        {
          timeout = 1800;
          on-timeout = "hyprlock";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1860;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
