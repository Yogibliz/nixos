# { lib, ... }:
# let
#   mod = "SUPER";
#   modS = "SUPER + SHIFT";
#   modA = "SUPER + ALT";
#
#   browser = "zen";
#   terminal = "ghostty";
#   explorer = "nautilus";
#   screenshot = "hyprshot -m region --clipboard-only -s";
#   noctalia = "noctalia-shell ipc call";
# in
# {
#   wayland.windowManager.hyprland.settings.bind = [
#     # Applications
#     {
#       key = "${mod} + Super_L";
#       dispatcher = "exec_cmd";
#       arg = "vicinae toggle";
#     }
#     {
#       key = "${mod} + Escape";
#       dispatcher = "exec_cmd";
#       arg = "${noctalia} lockScreen lock";
#     }
#     {
#       key = "${mod} + S";
#       dispatcher = "exec_cmd";
#       arg = "${noctalia} settings toggle";
#     }
#     {
#       key = "${mod} + W";
#       dispatcher = "exec_cmd";
#       arg = "${noctalia} wallpaper toggle";
#     }
#     {
#       key = "${mod} + T";
#       dispatcher = "exec_cmd";
#       arg = terminal;
#     }
#     {
#       key = "${mod} + B";
#       dispatcher = "exec_cmd";
#       arg = browser;
#     }
#     {
#       key = "${mod} + E";
#       dispatcher = "exec_cmd";
#       arg = explorer;
#     }
#     {
#       key = "${modS} + S";
#       dispatcher = "exec_cmd";
#       arg = screenshot;
#     }
#
#     # Window management
#     {
#       key = "${mod} + Q";
#       dispatcher = "hy3:kill_active";
#     }
#     {
#       key = "${mod} + F";
#       dispatcher = "fullscreen";
#     }
#     {
#       key = "${mod} + V";
#       dispatcher = "togglefloating";
#     }
#
#     # hy3: focus
#     {
#       key = "${mod} + H";
#       dispatcher = "hy3:move_focus";
#       arg = "l";
#     }
#     {
#       key = "${mod} + L";
#       dispatcher = "hy3:move_focus";
#       arg = "r";
#     }
#     {
#       key = "${mod} + K";
#       dispatcher = "hy3:move_focus";
#       arg = "u";
#     }
#     {
#       key = "${mod} + J";
#       dispatcher = "hy3:move_focus";
#       arg = "d";
#     }
#
#     # hy3: move window
#     {
#       key = "${modS} + H";
#       dispatcher = "hy3:move_window";
#       arg = "l";
#     }
#     {
#       key = "${modS} + L";
#       dispatcher = "hy3:move_window";
#       arg = "r";
#     }
#     {
#       key = "${modS} + K";
#       dispatcher = "hy3:move_window";
#       arg = "u";
#     }
#     {
#       key = "${modS} + J";
#       dispatcher = "hy3:move_window";
#       arg = "d";
#     }
#
#     # hy3: focus groups
#     {
#       key = "${mod} + A";
#       dispatcher = "hy3:change_focus";
#       arg = "raise";
#     }
#     {
#       key = "${modS} + A";
#       dispatcher = "hy3:change_focus";
#       arg = "lower";
#     }
#
#     # Media keys
#     {
#       key = "XF86AudioMute";
#       dispatcher = "exec_cmd";
#       arg = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
#     }
#     {
#       key = "XF86AudioPlay";
#       dispatcher = "exec_cmd";
#       arg = "playerctl play-pause";
#     }
#     {
#       key = "XF86AudioNext";
#       dispatcher = "exec_cmd";
#       arg = "playerctl next";
#     }
#     {
#       key = "XF86AudioPrev";
#       dispatcher = "exec_cmd";
#       arg = "playerctl previous";
#     }
#
#     # Resize
#     {
#       key = "${modA} + H";
#       dispatcher = "window:resize";
#       arg = {
#         x = 20;
#         y = 0;
#         relative = true;
#       };
#       repeat = true;
#     }
#     {
#       key = "${modA} + L";
#       dispatcher = "window:resize";
#       arg = {
#         x = -20;
#         y = 0;
#         relative = true;
#       };
#       repeat = true;
#     }
#     {
#       key = "${modA} + K";
#       dispatcher = "window:resize";
#       arg = {
#         x = 0;
#         y = -20;
#         relative = true;
#       };
#       repeat = true;
#     }
#     {
#       key = "${modA} + J";
#       dispatcher = "window:resize";
#       arg = {
#         x = 0;
#         y = 20;
#         relative = true;
#       };
#       repeat = true;
#     }
#
#     # Volume / Brightness
#     {
#       key = "XF86AudioLowerVolume";
#       dispatcher = "exec_cmd";
#       arg = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
#       repeat = true;
#     }
#     {
#       key = "XF86AudioRaiseVolume";
#       dispatcher = "exec_cmd";
#       arg = "wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+";
#       repeat = true;
#     }
#     {
#       key = "XF86MonBrightnessUp";
#       dispatcher = "exec_cmd";
#       arg = "brightnessctl set 5%+";
#       repeat = true;
#     }
#     {
#       key = "XF86MonBrightnessDown";
#       dispatcher = "exec_cmd";
#       arg = "brightnessctl set 5%-";
#       repeat = true;
#     }
#
#     # Mouse binds
#     {
#       key = "${mod} + mouse:272";
#       dispatcher = "window:drag";
#       mouse = true;
#     }
#     {
#       key = "${mod} + mouse:273";
#       dispatcher = "window:resize";
#       mouse = true;
#     }
#   ]
#   ++ (map (
#     i:
#     let
#       ws = toString i;
#     in
#     {
#       key = "${mod} + ${ws}";
#       dispatcher = "focus";
#       arg = {
#         workspace = ws;
#       };
#     }
#   ) (lib.range 1 5))
#   ++ (map (
#     i:
#     let
#       ws = toString i;
#     in
#     {
#       key = "${modS} + ${ws}";
#       dispatcher = "window:move";
#       arg = {
#         workspace = ws;
#       };
#     }
#   ) (lib.range 1 5));
{
  wayland.windowManager.hyprland = {
    extraConfig = ''
      local mod  = "SUPER"
      local modS = "SUPER + SHIFT"
      local modA = "SUPER + ALT"

      local browser = "zen"
      local terminal = "ghostty"
      local explorer = "nautilus"
      local screenshot = "hyprshot -m region --clipboard-only -s"
      local noctalia = "noctalia-shell ipc call"

      -- Applications
      hl.bind(mod .. " + Super_L", hl.dsp.exec_cmd("vicinae toggle"))
      hl.bind(mod .. " + Escape", hl.dsp.exec_cmd(noctalia .. " lockScreen lock"))
      hl.bind(mod .. " + S", hl.dsp.exec_cmd(noctalia .. " settings toggle"))
      hl.bind(mod .. " + W", hl.dsp.exec_cmd(noctalia .. " wallpaper toggle"))
      hl.bind(mod .. " + T", hl.dsp.exec_cmd(terminal))
      hl.bind(mod .. " + B", hl.dsp.exec_cmd(browser))
      hl.bind(mod .. " + E", hl.dsp.exec_cmd(explorer))
      hl.bind(modS .. " + S", hl.dsp.exec_cmd(screenshot))

      -- Window management
      hl.bind(mod .. " + Q", hy3.kill_active())
      hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
      hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))

      -- hy3: focus
      hl.bind(mod .. " + H", hy3.move_focus("l"))
      hl.bind(mod .. " + L", hy3.move_focus("r"))
      hl.bind(mod .. " + K", hy3.move_focus("u"))
      hl.bind(mod .. " + J", hy3.move_focus("d"))

      -- hy3: move window
      hl.bind(modS .. " + H", hy3.move_window("l"))
      hl.bind(modS .. " + L", hy3.move_window("r"))
      hl.bind(modS .. " + K", hy3.move_window("u"))
      hl.bind(modS .. " + J", hy3.move_window("d"))

      -- hy3: change focus group
      hl.bind(mod .. " + A", hy3.change_focus("raise"))
      hl.bind(modS .. " + A", hy3.change_focus("lower"))

      -- Media keys
      hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
      hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
      hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
      hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

      -- Workspaces 1-5
      for i = 1, 5 do
        local ws = tostring(i)
        hl.bind(mod .. " + " .. ws, hl.dsp.focus({ workspace = ws }))
        hl.bind(modS .. " + " .. ws, hl.dsp.window.move({ workspace = ws }))
      end

      -- Resize
      hl.bind(modA .. " + H", hl.dsp.window.resize({ x = 20, y = 0, relative = true }), { repeating = true })
      hl.bind(modA .. " + L", hl.dsp.window.resize({ x = -20, y = 0, relative = true }), { repeating = true })
      hl.bind(modA .. " + K", hl.dsp.window.resize({ x = 0, y = -20, relative = true }), { repeating = true })
      hl.bind(modA .. " + J", hl.dsp.window.resize({ x = 0, y = 20, relative = true }), { repeating = true })

      -- Volume / brightness
      hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
      hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
      hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 5%+"), { repeating = true })
      hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

      -- Mouse binds
      hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
      hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
    '';

  };
}
