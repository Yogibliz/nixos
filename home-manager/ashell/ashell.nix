{config, ...}: {
  programs.ashell = {
    enable = true;
    settings = {
      modules = {
        left = [
          "Workspaces"
          "MediaPlayer"
        ];
        center = [
          "Window Title"
        ];
        right = [
          "KeyboardLayout"
          "SystemInfo"
          [
            "Clock"
            "Privacy"
            "Settings"
          ]
        ];
      };
      appearance = {
        scale_factor = 1.5;
        opacity = 0.8;
      };
    };
  };
}
