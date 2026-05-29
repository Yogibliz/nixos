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

      -- Macro
      hl.bind("", "F13", hl.dsp.exec_cmd("~/LR_loop.sh"))

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
