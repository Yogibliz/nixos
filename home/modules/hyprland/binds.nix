{ lib, config, ... }:

let
  mod = "SUPER";
  modS = "SUPER + SHIFT";
  modA = "SUPER + ALT";

  browser = "zen";
  terminal = "ghostty";
  explorer = "nautilus";
  noctalia = "noctalia msg";

  # Helper using the lib.generators.mkLuaInline function.
  mkBind =
    {
      key,
      action,
      options ? null,
    }:
    {
      _args = [
        key
        (lib.generators.mkLuaInline action)
      ]
      ++ lib.optional (options != null) options;
    };
in
{
  wayland.windowManager.hyprland = {
    settings = {
      # Use `bind` and apply `map mkBind` across the combined list
      bind = map mkBind (
        [
          # =============================[ Macro ]============================= #
          {
            key = "XF86Tools";
            action = "hl.dsp.exec_cmd('/home/iris/LR_loop.sh')";
          }

          # =========================[ Applications ]========================== #
          {
            key = "${mod} + Super_L";
            action = "hl.dsp.exec_cmd('vicinae toggle')";
          }
          {
            key = "${mod} + Escape";
            action = "hl.dsp.exec_cmd('${noctalia} session lock')";
          }
          {
            key = "${mod} + W";
            action = "hl.dsp.exec_cmd('${noctalia} panel-toggle wallpaper')";
          }
          {
            key = "${mod} + C";
            action = "hl.dsp.exec_cmd('${noctalia} panel-toggle control-center')";
          }
          {
            key = "${mod} + T";
            action = "hl.dsp.exec_cmd('${terminal}')";
          }
          {
            key = "${mod} + B";
            action = "hl.dsp.exec_cmd('${browser}')";
          }
          {
            key = "${mod} + E";
            action = "hl.dsp.exec_cmd('${explorer}')";
          }
          {
            key = "${modS} + S";
            action = "hl.dsp.exec_cmd('${noctalia} screenshot-region')";
          }

          # =======================[ Window management ]======================= #
          {
            key = "${mod} + Q";
            action = "hl.plugin.hy3.kill_active()";
          }
          {
            key = "${mod} + F";
            action = "hl.dsp.window.fullscreen()";
          }
          {
            key = "${mod} + V";
            action = "hl.dsp.window.float({ action = 'toggle' })";
          }
          {
            key = "ALT + TAB";
            action = "hl.dsp.exec_cmd('${noctalia} window-switcher')";
          }

          # ==========================[ hy3: focus ]=========================== #
          {
            key = "${mod} + H";
            action = "hl.plugin.hy3.move_focus('l')";
          }
          {
            key = "${mod} + L";
            action = "hl.plugin.hy3.move_focus('r')";
          }
          {
            key = "${mod} + K";
            action = "hl.plugin.hy3.move_focus('u')";
          }
          {
            key = "${mod} + J";
            action = "hl.plugin.hy3.move_focus('d')";
          }

          # =======================[ hy3: move window ]======================== #
          {
            key = "${modS} + H";
            action = "hl.plugin.hy3.move_window('l')";
          }
          {
            key = "${modS} + L";
            action = "hl.plugin.hy3.move_window('r')";
          }
          {
            key = "${modS} + K";
            action = "hl.plugin.hy3.move_window('u')";
          }
          {
            key = "${modS} + J";
            action = "hl.plugin.hy3.move_window('d')";
          }

          # ====================[ hy3: change focus group ]==================== #
          {
            key = "${mod} + A";
            action = "hl.plugin.hy3.change_focus('raise')";
          }
          {
            key = "${modS} + A";
            action = "hl.plugin.hy3.change_focus('lower')";
          }

          # ===========================[ Media keys ]========================== #
          {
            key = "XF86AudioMute";
            action = "hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle')";
          }
          {
            key = "XF86AudioPlay";
            action = "hl.dsp.exec_cmd('playerctl play-pause')";
          }
          {
            key = "XF86AudioNext";
            action = "hl.dsp.exec_cmd('playerctl next')";
          }
          {
            key = "XF86AudioPrev";
            action = "hl.dsp.exec_cmd('playerctl previous')";
          }

          # =============================[ Resize ]============================ #
          {
            key = "${modA} + H";
            action = "hl.dsp.window.resize({ x = 20, y = 0, relative = true })";
            options = {
              repeating = true;
            };
          }
          {
            key = "${modA} + L";
            action = "hl.dsp.window.resize({ x = -20, y = 0, relative = true })";
            options = {
              repeating = true;
            };
          }
          {
            key = "${modA} + K";
            action = "hl.dsp.window.resize({ x = 0, y = -20, relative = true })";
            options = {
              repeating = true;
            };
          }
          {
            key = "${modA} + J";
            action = "hl.dsp.window.resize({ x = 0, y = 20, relative = true })";
            options = {
              repeating = true;
            };
          }

          # ============================[ Volume ]============================ #
          {
            key = "XF86AudioLowerVolume";
            action = "hl.dsp.exec_cmd('wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-')";
            options = {
              repeating = true;
            };
          }
          {
            key = "XF86AudioRaiseVolume";
            action = "hl.dsp.exec_cmd('wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+')";
            options = {
              repeating = true;
            };
          }
          {
            key = "${mod} + mouse_up";
            action = "hl.dsp.exec_cmd('${noctalia} volume-down')";
          }
          {
            key = "${mod} + mouse_down";
            action = "hl.dsp.exec_cmd('${noctalia} volume-up')";
          }

          # ==========================[ Brightness ]========================== #
          {
            key = "XF86MonBrightnessUp";
            action = "hl.dsp.exec_cmd('brightnessctl set 5%+')";
            options = {
              repeating = true;
            };
          }
          {
            key = "XF86MonBrightnessDown";
            action = "hl.dsp.exec_cmd('brightnessctl set 5%-')";
            options = {
              repeating = true;
            };
          }

          # ==========================[ Mouse binds ]========================== #
          {
            key = "${mod} + mouse:272";
            action = "hl.dsp.window.drag()";
            options = {
              mouse = true;
            };
          }
          {
            key = "${mod} + mouse:273";
            action = "hl.dsp.window.resize()";
            options = {
              mouse = true;
            };
          }
        ]
        # ===========================[ Workspaces ]========================== #
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = toString (i + 1);
            in
            [
              {
                key = "${mod} + ${ws}";
                action = "hl.dsp.focus({ workspace = '${ws}' })";
              }
              {
                key = "${modS} + ${ws}";
                action = "hl.dsp.window.move({ workspace = '${ws}' })";
              }
            ]
          ) 5
        ))
      );
    };
  };
}
