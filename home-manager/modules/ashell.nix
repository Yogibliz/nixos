{
  pkgs,
  inputs,
  ...
}: {
  programs.ashell = {
    enable = true;
    # Follow source instead through flake, keeps it up-to-date with config page
    package = inputs.ashell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    settings = {
      layer = "Top";

      # Which Modules? Where?
      modules = {
        left = ["Tray" "MediaPlayer"];
        center = ["WindowTitle"];
        right = [
          "KeyboardLayout"
          "SystemInfo"
          ["Tempo" "Settings"]
        ];
      };

      # Module settings (settings is a module)
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

      tempo = {
        weather_location = {
          City = "Linköping";
        };
      };

      # Apperance
      appearance = {
        font_name = "JetBrainsMonoNL Nerd Font Mono";
        scale_factor = 1.2;
        opacity = 0.7;
        menu = {
          opacity = 0.7;
        };
      };
    };
  };
}
