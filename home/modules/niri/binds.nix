{ ... }:
{
  programs.niri.settings.binds = {
    # ── Apps ──────────────────────────────────────────────────────────────────
    "Mod+T".action.spawn = "ghostty";
    "Mod+B".action.spawn = "zen";
    "Mod+E".action.spawn = "nautilus";

    # ── Noctalia ──────────────────────────────────────────────────────────────
    "Mod+D".action.spawn = [
      "vicinae"
      "toggle"
    ];
    "Mod+Escape".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "lockScreen"
      "lock"
    ];
    "Mod+S".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "settings"
      "toggle"
    ];
    "Mod+W".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "wallpaper"
      "toggle"
    ];

    # ── Window management ─────────────────────────────────────────────────────
    "Mod+Space".action.toggle-overview = { };
    "Mod+Q".action.close-window = { };
    "Mod+F".action.fullscreen-window = { };
    "Mod+V".action.toggle-window-floating = { };

    # ── Focus movement ────────────────────────────────────────────────────────
    "Mod+H".action.focus-column-left = { };
    "Mod+L".action.focus-column-right = { };
    "Mod+K".action.focus-window-up = { };
    "Mod+J".action.focus-window-down = { };

    # ── Window movement ───────────────────────────────────────────────────────
    "Mod+Shift+H".action.move-column-left = { };
    "Mod+Shift+L".action.move-column-right = { };
    "Mod+Shift+K".action.move-window-up = { };
    "Mod+Shift+J".action.move-window-down = { };

    # ── Workspaces ────────────────────────────────────────────────────────────
    "Mod+1".action.focus-workspace = 1;
    "Mod+2".action.focus-workspace = 2;
    "Mod+3".action.focus-workspace = 3;
    "Mod+4".action.focus-workspace = 4;
    "Mod+5".action.focus-workspace = 5;

    "Mod+Shift+1".action.move-column-to-workspace = 1;
    "Mod+Shift+2".action.move-column-to-workspace = 2;
    "Mod+Shift+3".action.move-column-to-workspace = 3;
    "Mod+Shift+4".action.move-column-to-workspace = 4;
    "Mod+Shift+5".action.move-column-to-workspace = 5;

    # ── Screenshot ────────────────────────────────────────────────────────────
    "Mod+Shift+S".action.screenshot = { };

    # ── Media / hardware keys ─────────────────────────────────────────────────
    "XF86AudioRaiseVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "-l"
        "1.5"
        "@DEFAULT_AUDIO_SINK@"
        "5%+"
      ];
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action.spawn = [
        "wpctl"
        "set-volume"
        "@DEFAULT_AUDIO_SINK@"
        "5%-"
      ];
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action.spawn = [
        "wpctl"
        "set-mute"
        "@DEFAULT_AUDIO_SINK@"
        "toggle"
      ];
      allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      action.spawn = [
        "playerctl"
        "play-pause"
      ];
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action.spawn = [
        "playerctl"
        "next"
      ];
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action.spawn = [
        "playerctl"
        "previous"
      ];
      allow-when-locked = true;
    };
    "XF86MonBrightnessUp".action.spawn = [
      "brightnessctl"
      "set"
      "5%+"
    ];
    "XF86MonBrightnessDown".action.spawn = [
      "brightnessctl"
      "set"
      "5%-"
    ];
  };
}
