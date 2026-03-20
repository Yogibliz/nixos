{
  config,
  ashell-pkg,
  ...
}: {
  programs.ashell = {
    enable = true;
    package = ashell-pkg;
    settings = {
      layer = "Top";
      modules = {
        left = [
          "Tray"
          "MediaPlayer"
        ];
        center = [
          "WindowTitle"
        ];
        right = [
          "KeyboardLayout"
          "SystemInfo"
          [
            "Tempo"
            "Privacy"
            "Settings"
          ]
        ];
      };
      settings = {
        lock_cmd = "hyprlock";
        vpn_more_cmd = "nm-connection-editor";
        wifi_more_cmd = "nm-connection-editor";
        audio_sinks_more_cmd = "pavucontrol";
        bluetooth_more_cmd = "blueman-manager";
      };

      system_info = {
        indicators = ["Cpu" "Memory" "Temperature"];
        temperature = {
          sensor = "k10temp Tctl";
          warn_threshold = 70;
          alert_threshold = 85;
        };
      };

      appearance = {
        scale_factor = 1.5;
        opacity = 0.8;
      };
    };
  };
}
