{ ... }:
{
  programs.niri = {
    settings = {
      prefer-no-csd = true;

      hotkey-overlay.skip-at-startup = true;

      cursor = {
        hide-when-typing = true;
      };

      gestures.hot-corners.enable = false;

      input = {
        keyboard.xkb = {
          layout = "us,se";
          options = "grp:alt_space_toggle,caps:escape";
        };
        touchpad = {
          natural-scroll = true;
          tap = true;
        };
        focus-follows-mouse.enable = true;
      };

      layout = {
        gaps = 10;
        border = {
          enable = true;
          width = 4;
          active.color = "#c4a7e7";
          inactive.color = "#403d52";
        };

        focus-ring.enable = false;
      };

      window-rules = [
        {
          matches = [ ];
          geometry-corner-radius = {
            top-left = 12.0;
            top-right = 12.0;
            bottom-left = 12.0;
            bottom-right = 12.0;
          };
          clip-to-geometry = true;
        }
        {
          matches = [ { app-id = "^steam$"; } ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "^steam$";
              title = "^Steam$";
            }
          ];
          open-floating = false;
        }
      ];

      spawn-at-startup = [
        { command = [ "noctalia-shell" ]; }
        {
          command = [
            "vicinae"
            "server"
          ];
        }
      ];
    };
  };
}
