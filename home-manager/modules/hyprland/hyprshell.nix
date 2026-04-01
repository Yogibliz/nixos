{
  services.hyprshell = {
    enable = true;
    settings = {
      version = 4;
      windows = {
        scale = 8.0;
        overview = {
          key = "Super_L";
          modifier = "super";
          launcher = {
            max_items = 6;
            default_terminal = "ghostty";
            plugins = {
              applications = {};
              calc = {};
              terminal = {};
            };
          };
        };
        switch = {
          key = "Tab";
          modifier = "alt";
          filter_by = ["current_workspace"];
        };
      };
    };
  };
}
