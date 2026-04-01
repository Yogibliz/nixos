{
  services.hyprshell = {
    enable = true;
    settings.windows = {
      enable = true;
      scale = 8.0;
      overview = {
        enable = true;
        key = "Super_L";
        modifier = "super";
        launcher = {
          max_items = 6;
          default_terminal = "ghostty";
          plugins = {
            applications.enable = true;
            calc.enable = true;
            terminal.enable = true;
          };
        };
      };
      switch = {
        enable = true;
        key = "Tab";
        modifier = "alt";
        filter_by = ["current_monitor"];
      };
      switch_2 = {
        enable = true;
        key = "Tab";
        modifier = "alt";
        filter_by = ["current_monitor"];
      };
    };
  };
}
