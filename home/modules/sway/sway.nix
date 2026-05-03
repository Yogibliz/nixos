{ ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;

    config = {
      modifier = "Mod4";
      terminal = "ghostty";
      bars = [ ];

      input."*" = {
        xkb_layout = "us,se";
        xkb_options = "grp:win_space_toggle,caps:escape";
        natural_scroll = "enabled";
      };

      gaps = {
        inner = 5;
        outer = 10;
      };

      startup = [
        { command = "noctalia-shell"; }
        { command = "vicinae server"; }
      ];

      window.border = 2;
      window.commands = [
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
}
