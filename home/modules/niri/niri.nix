{ ... }:
{
  programs.niri = {
    enable = true;
    settings = {
      prefer-no-csd = true;

      input = {
        keyboard.xkb = {
          layout = "us,se";
          options = "grp:win_space_toggle,caps:escape";
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
          width = 2;
        };
      };

      window-rules = [
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
      ];
    };
  };
}
