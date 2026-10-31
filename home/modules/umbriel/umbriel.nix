{ ... }:
{
  programs.umbriel = {
    enable = true;
    settings = {
      include.optional.files = [ "noctalia.toml" ];

      general = {
        mod_key = "Super";
        show_cheatsheet = false;
        autostart = [
          "noctalia"
          "skwd-walld"
        ];
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
        {
          match = {
            app_id = "^steam_app_230410$";
          };
          default_output = "DP-2";
        }
        {
          match = {
            app_id = "^steam$";
            title = "[Bb]ig [Pp]icture";
          };
          default_output = "sunshine";
          default_fullscreen = true;
          default_floating = false;
        }
        {
          match.app_id = "^steam_app_";
          default_output = "sunshine";
        }
      ];

      appearance = {
        border_width = 4;
        corner_radius = 15;
      };

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
