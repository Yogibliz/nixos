{ ... }:
{
  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        mod_key = "Super";
        xwayland = true;
        show_cheatsheet = false;
        autostart = [ "noctalia" ];
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
