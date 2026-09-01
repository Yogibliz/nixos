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
      "Mod+XF86AudioMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
      "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";

    };
  };
}
