{
  wayland.windowManager.hyprland.settings = {
    "$leader" = "SUPER";
    "$terminal" = "ghostty";
    "$explorer" = "yazi";
    "$browser" = "zen";
    "$hyprshot" = "hyprshot -m region --clipboard-only -s";

    binde = [
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    bind =
      [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        "$leader, escape, exec, hyprlock"
        "$leader, T, exec, $terminal"
        "$leader, Q, killactive"
        "$leader, B, exec, $browser"
        "$leader, F, fullscreen"
        "$leader, V, togglefloating"
        "$leader SHIFT, S, exec, $hyprshot"
        "$leader, E, exec, $explorer"

        "$leader, H, hy3:movefocus, l"
        "$leader, L, hy3:movefocus, r"
        "$leader, K, hy3:movefocus, u"
        "$leader, J, hy3:movefocus, d"

        "$leader SHIFT, H, hy3:movewindow, l"
        "$leader SHIFT, L, hy3:movewindow, r"
        "$leader SHIFT, K, hy3:movewindow, u"
        "$leader SHIFT, J, hy3:movewindow, d"

        "$leader, G, hy3:makegroup, h"
        "$leader SHIFT, G, hy3:makegroup, v"
        "$leader, W, hy3:makegroup, tab"

        "$leader, A, hy3:changefocus, raise"
        "$leader SHIFT, A, hy3:changefocus, lower"
      ]
      ++ builtins.concatMap (
        n: let
          ws = toString n;
        in [
          "$leader, ${ws}, workspace, ${ws}"
          "$leader SHIFT, ${ws}, movetoworkspace, ${ws}"
        ]
      ) (builtins.genList (x: x + 1) 5);

    bindm = [
      "$leader, mouse:272, movewindow"
      "$leader, mouse:273, resizewindow"
    ];
  };
}
