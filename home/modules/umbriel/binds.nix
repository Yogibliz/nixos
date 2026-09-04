{ ... }:
let
  browser = "zen";
  terminal = "ghostty";
  explorer = "nautilus";
  launcher = "vicinae toggle";
  noctalia = "noctalia msg";
in
{
  programs.umbriel = {
    settings.keybinds = {

      # =============================[ Umbriel ]============================= #
      "Mod+Q" = "window-close";
      "Mod+F" = "window-toggle-fullscreen";
      "Mod+V" = "window-toggle-floating";
      "Mod+H" = "window-focus-left";
      "Mod+L" = "window-focus-right";
      "Mod+K" = "window-focus-up";
      "Mod+J" = "window-focus-down";
      "Mod+Shift+H" = "window-consume-or-expel-left";
      "Mod+Shift+L" = "window-consume-or-expel-right";
      "Mod+Shift+K" = "window-move-up";
      "Mod+Shift+J" = "window-move-down";
      "Mod+WheelUp" = "window-focus-left";
      "Mod+WheelDown" = "window-focus-right";
      "Mod+Shift+WheelUp" = "column-move-left";
      "Mod+Shift+WheelDown" = "column-move-right";
      "Mod+MouseMiddle" = "overview-toggle";
      "Mod+1" = "workspace-switch:1";
      "Mod+2" = "workspace-switch:2";
      "Mod+3" = "workspace-switch:3";
      "Mod+4" = "workspace-switch:4";
      "Mod+Shift+1" = "window-move-to-workspace:1";
      "Mod+Shift+2" = "window-move-to-workspace:2";
      "Mod+Shift+3" = "window-move-to-workspace:3";
      "Mod+Shift+4" = "window-move-to-workspace:4";

      # ==============================[ Apps ]============================== #
      "Mod" = "spawn:${launcher}";
      "Mod+T" = "spawn:${terminal}";
      "Mod+B" = "spawn:${browser}";
      "Mod+E" = "spawn:${explorer}";

      # ============================[ Noctalia ]============================ #
      "Mod+Shift+S" = "spawn:${noctalia} screenshot-region";
      "Mod+Escape" = "spawn:${noctalia} session lock";
      "Mod+W" = "spawn:${noctalia} panel-toggle wallpaper";
      "Mod+D" = "spawn:${noctalia} panel-toggle control-center";

      # ==========================[ Media Buttons ]========================== #
      "XF86AudioRaiseVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioLowerVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
      "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";

    };
  };
}
