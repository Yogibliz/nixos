{ ... }:
{
  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        mod_key = "Super";
        show_cheatsheet = false;
        autostart = [ "noctalia" ];
      };

      window_rule = [
        {
          match = {
            app_id = "^steam$";
          };
          default_floating = true;
        }
        {
          match = {
            app_id = "^steam$";
            title = "^Steam$";
          };
          default_floating = false;
        }
      ];

      input = {
        focus = {
          follows_mouse = true;
        };

        cursor = {
          follows_focus = true;
        };

        keyboard = {
          layout = "us,se";
          options = "grp:win_space_toggle, caps:escape";
        };
      };
    };
  };
}
