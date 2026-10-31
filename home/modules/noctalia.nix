{
  pkgs,
  lib,
  config,
  ...
}:
{

  programs.noctalia = {
    enable = true;

    settings = {
      # ----- Widget Settings -----
      widget = {
        media = {
          title_scroll = "always";
          max_length = 450;
          hide_when_idle = true;
        };

        tray = {
          hidden = [
            "nm-applet"
            "blueman"
          ];
        };
      };

      # ----- Control Center Settings -----
      control_center = {
        sidebar = "full";
        sidebar_section = "full";
        width = 1200;
      };

      # ----- Dock -----
      dock.monitor."DP-2" = {
        enabled = true;
        reserve_space = false;
        show_dots = true;
        show_instance_count = false;
        smart_auto_hide = true;
        pinned = [
          "firefox" # "zen-twilight"
          "org.gnome.Nautilus"
          "com.mitchellh.ghostty"
          "SONE"
          # "root"
          "vesktop"
        ];
      };

      # ----- Notification -----
      notification = {
        history_retention_hours = 1;
      };

      # ----- Location Service Settings -----
      location = {
        auto_locate = true;
      };

      # ----- Calendar -----
      calendar = {
        enabled = true;
        account.lesson_schedule = {
          color = "primary";
          name = "Lesson Schedule";
          server_url = "https://cloud.timeedit.net/liu/web/schema/ri67QQ89Y38Z4nQ5Y882X3X5y5Z661Z16041549Q6974011.ics";
          type = "ics";
        };
      };

      # ----- Idle -----
      idle = {
        behavior_order = [
          "screen-off"
          "lock"
          "lock-and-suspend"
        ];
        behavior = {
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 120.0;
          };
          lock = {
            action = "lock";
            enabled = true;
            timeout = 180.0;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 300.0;
          };
        };
      };

      # ----- Shell Settings -----
      shell = {
        lang = "en-US";
        avatar_path = "${config.home.homeDirectory}/dotfiles/.face";
        settings_window_translucent = true;
        screen_time_enabled = true;
        polkit_agent = true;
        launcher = {
          layout = "full";
          width = "800";
          search_position = "top";
          default_view = "pinned";
          categories = false;
          show_settings_button = true;
          show_session_button = false;
          app_grid = false;
          track_usage = false;
          pinned = [
            "firefox" # "zen-twilight"
            "com.mitchellh.ghostty"
            "SONE"
            "vesktop"
            "root"
          ];
          providers = {
            session.global = true;
            calculator.global = true;
          };
        };
        screen_corners = {
          enabled = true;
        };
        screenshot = {
          save_to_file = false;
          copy_to_clipboard = true;
          freeze_screen = true;
        };
        greeter_sync = {
          auto_sync = false;
        };
        panel = {
          transparency_mode = "glass";
        };
      };

      # ----- Bar Settings -----
      bar.main = {
        position = "top";
        thickness = 48;
        background_opacity = 0.8;
        margin_ends = 360;

        # ----- Monitor overrides -----
        monitor = {
          dp3 = {
            match = "DP-1";
            enabled = false;
          };

          dp2 = {
            match = "DP-3";
            enabled = false;
          };
        };

        # ----- Capsule Group(s) -----
        capsule_group = [
          {
            id = "";
            members = [ ];
            enabled = true;
          }
        ];

        # ----- Bar Widgets -----
        start = [
          "workspaces"
        ];
        center = [ "clock" ];
        end = [
          "media"
          "tray"
          "notifications"
          "bluetooth"
          "volume"
          "brightness"
          "battery"
          "session"
        ];
      };

      # ----- Weather Settings -----
      weather = {
        enabled = true;
        refresh_minutes = 15;
        unit = "metric";
        effects = true;
      };

      # ----- Theme Settings -----
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";
        pure_black_dark = true;

        templates = {
          builtin_ids = [ "umbriel" ];
        };
      };

      # ----- Plugin Settings -----
      plugins = {
        enabled = [
          "tmelik/system-monitor"
          "nilsonlinux/rss-notifier"
        ];
      };

      plugin_settings = {
        "tmelik/system-monitor" = {
          show_download = false;
          show_upload = false;
          disk_display_mode = "used";
        };

        "nilsonlinux/rss-notifier" = {
          refresh_minutes = 1;
          feeds = [
            "https://diyhrt.coffee/api/v1/feed/stock.rss?only=restocks&region=EU"
          ];
        };
      };
    };
  };
}
