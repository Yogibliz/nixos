{ ... }:
{
  programs.walker = {
    enable = true;
    runAsService = true;

    themes = {
      live-theme = {
        style = ''
          @import url("file:///home/iris/.config/walker-live.css");
        '';
      };
    };

    config = {
      hide_action_hints = true;
      theme = "live-theme";
      placeholders = {
        default = {
          input = "Search...";
          list = "No Results Found";
        };
      };

      providers = {
        max_results = 6;
        default = [
          "desktopapplications"
          "bluetooth"
          "files"
          "protonpass"
        ];
        prefixes = [
          {
            provider = "bluetooth";
            prefix = "b ";
          }
          {
            provider = "protonpass";
            prefix = "p ";
          }
        ];
      };

      shell = {
        layer = "overlay";
      };
    };
  };
}
