# ── Hyprland ──────────────────────────────────────────────
{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      # Monitor config
      monitor = [
        "DP-2, 1920x1080@60, 0x0, 1, transform, 3"
        "DP-1, 3440x1440@175, 1080x0, 1"
        "DP-3, 1920x1080@144, 4520x0, 1"
        "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"
      ];

      # Window Rules
      windowrulev2 = [
        "float, class:^(steam)$"
        "tile, class:^(steam)$, title:^(Steam)$"
      ];

      # Environment variables
      env = [
        "GTK_THEME,Adwaita:dark"
        "QT_QPA_PLATFORMTHEME,gtk3"
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
      };

      # Basic apps to set
      "$terminal" = "ghostty";
      "$menu" = "pkill fuzzel || fuzzel";
      "$browser" = "firefox";
      "$explorer" = "nautilus";
      "$hyprshot" = "hyprshot -m region --clipboard-only -s";

      exec-once = [
	"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP DISPLAY"
        "ashell"
      ];

      input = {
        kb_layout = "us,se";
        kb_options = "grp:win_space_toggle";
        follow_mouse = 1;
        touchpad.natural_scroll = true;
      };

      # Basic keybinds
      bind = [
        "SUPER, T, exec, $terminal"
        "SUPER, Q, killactive"
        "SUPER, B, exec, $browser"
        "SUPER, E, exec, $explorer"
        "SUPER, F, fullscreen"
        "SUPER, V, togglefloating"
        "SUPER SHIFT, S, exec, $hyprshot"

        # Move windows
        "SUPER SHIFT, H, movewindow, l"
        "SUPER SHIFT, L, movewindow, r"
        "SUPER SHIFT, K, movewindow, u"
        "SUPER SHIFT, J, movewindow, d"

        # Move focus
        "SUPER, H, movefocus, l"
        "SUPER, L, movefocus, r"
        "SUPER, K, movefocus, u"
        "SUPER, J, movefocus, d"

        # Workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"

        # Move window to workspace
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
      ];

      bindr = [
        "SUPER, Super_L, exec, $menu"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };

  # Dark mode
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

  home.sessionVariables = {
    GTK_THEME = "Adwaita:dark";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_STYLE_OVERRIDE = "adwaita-dark";
  };

  # Useful companion packages
  home.packages = with pkgs; [
    fuzzel # app launcher
    ghostty # terminal
    wl-clipboard # clipboard
    hyprpaper # wallpaper
    hyprlock # screen lock
    hyprshot # screenshot tool
  ];
}
