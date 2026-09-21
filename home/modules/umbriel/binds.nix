{ ... }:
let
  browser = "zen-beta";
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
      "Mod+H" = "window-focus-or-output-left";
      "Mod+L" = "window-focus-or-output-right";
      "Mod+K" = "window-focus-or-output-up";
      "Mod+J" = "window-focus-or-output-down";
      "Mod+Shift+H" = "window-move-or-output-left";
      "Mod+Shift+L" = "window-move-or-output-right";
      "Mod+Shift+K" = "window-move-or-workspace-up";
      "Mod+Shift+J" = "window-move-or-workspace-down";
      "Mod+WheelUp" = "window-focus-or-output-left";
      "Mod+WheelDown" = "window-focus-or-output-right";
      "Mod+Shift+WheelUp" = "window-move-or-output-left";
      "Mod+Shift+WheelDown" = "window-move-or-output-right";
      "Mod+MouseMiddle" = "overview-toggle";
      "Mod+1" = "workspace-switch:1";
      "Mod+2" = "workspace-switch:2";
      "Mod+Shift+1" = "window-move-to-workspace:1";
      "Mod+Shift+2" = "window-move-to-workspace:2";

      # ==============================[ Apps ]============================== #
      "Mod" = "spawn:${launcher}";
      "Mod+T" = "spawn:${terminal}";
      "Mod+B" = "spawn:${browser}";
      "Mod+E" = "spawn:${explorer}";

      # ============================[ Noctalia ]============================ #
      "Mod+Shift+S" = "spawn:${noctalia} screenshot-region";
      "Mod+Escape" = "spawn:${noctalia} session lock";
      "Mod+W" = "spawn:${noctalia} panel-toggle wallpaper";
      "Mod+Shift+W" = "spawn:${noctalia} panel-toggle noctalia/wallhaven:browser";
      "Mod+Alt+W" = "spawn:${noctalia} panel-toggle noctalia/mpvpaper:picker";
      "Mod+C" = "spawn:${noctalia} panel-toggle control-center";
      "Mod+N" = "spawn:${noctalia} panel-toggle control-center notifications";
      "Mod+D" = "spawn:${noctalia} panel-toggle raycursive/discord-voice:panel";
      "Mod+R" = "spawn:${noctalia} panel-toggle avivbintangaringga/nix-monitor:panel";

      # ==========================[ Media Buttons ]========================== #
      "XF86AudioRaiseVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioLowerVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86AudioMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86AudioPlay" = "spawn:playerctl play-pause";
      "XF86AudioNext" = "spawn:playerctl next";
      "XF86AudioPrev" = "spawn:playerctl previous";
      "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
      "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";

    };
  };
}
