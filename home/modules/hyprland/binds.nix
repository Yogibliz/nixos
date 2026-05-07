{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    "$modS" = "SUPER SHIFT";
    "$modA" = "SUPER ALT";

    "$browser" = "zen";
    "$menu" = "vicinae";
    "$terminal" = "ghostty";
    "$explorer" = "nautilus";
    "$screenshot" = "hyprshot -m region --clipboard-only -s";
    "$noctalia" = "noctalia-shell ipc call";

    bind = [
      "$mod, Super_L, exec, vicinae toggle"
      "$mod, escape, exec, $noctalia lockScreen lock"
      "$mod, S, exec, $noctalia settings toggle"
      "$mod, W, exec, $noctalia wallpaper toggle"
      "$mod, T, exec, $terminal"
      "$mod, Q, killactive"
      "$mod, B, exec, $browser"
      "$mod, F, fullscreen"
      "$mod, V, togglefloating"
      "$modS, S, exec, $screenshot"
      "$mod, E, exec, $explorer"

      "$mod, H, hy3:movefocus, l"
      "$mod, L, hy3:movefocus, r"
      "$mod, K, hy3:movefocus, u"
      "$mod, J, hy3:movefocus, d"

      "$modS, H, hy3:movewindow, l"
      "$modS, L, hy3:movewindow, r"
      "$modS, K, hy3:movewindow, u"
      "$modS, J, hy3:movewindow, d"

      "$mod, A, hy3:changefocus, raise"
      "$modS, A, hy3:changefocus, lower"

      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

    ]
    ++ builtins.concatMap (
      n:
      let
        ws = toString n;
      in
      [
        "$mod, ${ws}, workspace, ${ws}"
        "$modS, ${ws}, movetoworkspace, ${ws}"
      ]
    ) (builtins.genList (x: x + 1) 5);

    binde = [
      "$modA, H, resizeactive, -20 0"
      "$modA, L, resizeactive, 20 0"
      "$modA, K, resizeactive, 0 -20"
      "$modA, J, resizeactive, 0 20"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
