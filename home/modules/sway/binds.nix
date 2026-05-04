{ ... }:
{
  wayland.windowManager.sway.config.keybindings =
    let
      mod = "Mod4";
    in
    {
      "${mod}+Return" = "exec ghostty";
      "${mod}+d" = "exec vicinae toggle";
      "${mod}+b" = "exec zen";
      "${mod}+e" = "exec nautilus";
      "${mod}+q" = "kill";
      "${mod}+f" = "fullscreen toggle";
      "${mod}+v" = "floating toggle";
      "${mod}+Shift+s" = "exec grim -g \"$(slurp)\" - | wl-copy";
      "${mod}+w" = "noctalia-shell ipc call wallpaper toggle";
      "${mod}+s" = "noctalia-shell ipc call settings toggle";
      "${mod}+Escape" = "noctalia-shell ipc call lockScreen lock";

      "${mod}+h" = "focus left";
      "${mod}+l" = "focus right";
      "${mod}+k" = "focus up";
      "${mod}+j" = "focus down";

      "${mod}+Shift+h" = "move left";
      "${mod}+Shift+l" = "move right";
      "${mod}+Shift+k" = "move up";
      "${mod}+Shift+j" = "move down";

      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";

      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";

      "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
      "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
      "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      "XF86AudioPlay" = "exec playerctl play-pause";
      "XF86AudioNext" = "exec playerctl next";
      "XF86AudioPrev" = "exec playerctl previous";
      "XF86MonBrightnessUp" = "exec brightnessctl set 5%+";
      "XF86MonBrightnessDown" = "exec brightnessctl set 5%-";
    };
}
