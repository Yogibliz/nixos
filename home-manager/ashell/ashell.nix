{
  config,
  pkgs-unstable,
  ...
}: {
  programs.ashell = {
    enable = true;
    package = pkgs-unstable.ashell;
    settings = {
      modules = {
        left = [
          "Workspaces"
          "MediaPlayer"
        ];
        center = [
          "WindowTitle"
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
