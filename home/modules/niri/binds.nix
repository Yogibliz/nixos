{ config, ... }:
{
  programs.niri.settings.binds = with config.lib.niri.actions; {
    # ── Apps ──────────────────────────────────────────────────────────────────
    "Mod+T".action = spawn "ghostty";
    "Mod+B".action = spawn "zen";
    "Mod+E".action = spawn "nautilus";

    # ── Noctalia ──────────────────────────────────────────────────────────────
    "Mod+Super_L".action = spawn "noctalia-shell" "ipc" "call" "launcher" "toggle";
    "Mod+Escape".action = spawn "noctalia-shell" "ipc" "call" "lockScreen" "lock";
    "Mod+S".action = spawn "noctalia-shell" "ipc" "call" "settings" "toggle";
    "Mod+W".action = spawn "noctalia-shell" "ipc" "call" "wallpaper" "toggle";

    # ── Window management ─────────────────────────────────────────────────────
    "Mod+Q".action = closeWindow;
    "Mod+F".action = fullscreenWindow;
    "Mod+V".action = toggleWindowFloating;

    # ── Focus movement ────────────────────────────────────────────────────────
    "Mod+H".action = focusColumnLeft;
    "Mod+L".action = focusColumnRight;
    "Mod+K".action = focusWindowUp;
    "Mod+J".action = focusWindowDown;

    # ── Window movement ───────────────────────────────────────────────────────
    "Mod+Shift+H".action = moveColumnLeft;
    "Mod+Shift+L".action = moveColumnRight;
    "Mod+Shift+K".action = moveWindowUp;
    "Mod+Shift+J".action = moveWindowDown;

    # ── Workspaces ────────────────────────────────────────────────────────────
    "Mod+1".action = focusWorkspace 1;
    "Mod+2".action = focusWorkspace 2;
    "Mod+3".action = focusWorkspace 3;
    "Mod+4".action = focusWorkspace 4;
    "Mod+5".action = focusWorkspace 5;

    "Mod+Shift+1".action = moveColumnToWorkspace 1;
    "Mod+Shift+2".action = moveColumnToWorkspace 2;
    "Mod+Shift+3".action = moveColumnToWorkspace 3;
    "Mod+Shift+4".action = moveColumnToWorkspace 4;
    "Mod+Shift+5".action = moveColumnToWorkspace 5;

    # ── Screenshot ────────────────────────────────────────────────────────────
    "Mod+Shift+S".action = screenshot;

    # ── Media / hardware keys ─────────────────────────────────────────────────
    "XF86AudioRaiseVolume" = {
      action = spawn "wpctl" "set-volume" "-l" "1.5" "@DEFAULT_AUDIO_SINK@" "5%+";
      allow-when-locked = true;
    };
    "XF86AudioLowerVolume" = {
      action = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "5%-";
      allow-when-locked = true;
    };
    "XF86AudioMute" = {
      action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
      allow-when-locked = true;
    };
    "XF86AudioPlay" = {
      action = spawn "playerctl" "play-pause";
      allow-when-locked = true;
    };
    "XF86AudioNext" = {
      action = spawn "playerctl" "next";
      allow-when-locked = true;
    };
    "XF86AudioPrev" = {
      action = spawn "playerctl" "previous";
      allow-when-locked = true;
    };
    "XF86MonBrightnessUp".action = spawn "brightnessctl" "set" "5%+";
    "XF86MonBrightnessDown".action = spawn "brightnessctl" "set" "5%-";
  };
}
