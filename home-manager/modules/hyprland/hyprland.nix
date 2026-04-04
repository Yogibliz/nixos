{ pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [ pkgs.hyprlandPlugins.hy3 ];

    settings = {
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

      exec-once = [
        "ashell"
        "hyprshell run"
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
