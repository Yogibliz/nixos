{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  reloadHook = pkgs.writeShellScriptBin "noctalia-reload-hook" ''
    (
      export PATH="${config.home.profileDirectory}/bin:/run/current-system/sw/bin:$PATH"
      
      ${pkgs.hyprland}/bin/hyprctl eval "$(${pkgs.coreutils}/bin/cat ${config.xdg.configHome}/hypr/colors.lua)"
      
      systemctl --user restart vicinae
      ${pkgs.coreutils}/bin/sleep 1
      vicinae theme set palette
    ) >/dev/null 2>&1 &
  '';
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;

    settings = {
      # ----- Widget Settings -----
      widget = {
        media = {
          title_scroll = "always";
          max_length = 450;
        };
      };

      # ----- Control Center Settings -----
      control_center = {
        width = 1200;
      };

      # ----- Location Service Settings -----
      location = {
        auto_locate = true;
      };

      # ----- Shell Settings -----
      shell = {
        settings_show_advanced = true;
        panel = {
          transparency_mode = "glass";
        };
      };

      # ----- Bar Settings -----
      bar.main = {
        monitor = {
          dp3 = {
            match = "DP-3";
            enabled = false;
          };

          dp2 = {
            match = "DP-2";
            enabled = false;
          };
        };

        # ----- Capsule Group(s) -----
        capsule_group = {
          id = "wp";
          members = [
            "wallpaper"
            "wallhaven"
            "mpvpaper"
          ];
          enabled = true;
        };

        position = "top";
        capsule = "true";
        thickness = 46;
        background_opacity = 0.8;

        # ----- Bar Widgets -----
        start = [
          "group:wp"
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

      # ----- Wallpaper Settings -----
      wallpaper = {
        enabled = true;
        directory = "$HOME/dotfiles/Wallpapers";
      };

      # ----- Theme Settings -----
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "m3-content";

        templates.user = {
          vicinae = {
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/vicinae.toml";
            output_path = "$XDG_DATA_HOME/vicinae/themes/palette.toml";
            post_hook = "${lib.getExe reloadHook}";
          };
          hyprland_colors = {
            input_path = "$XDG_CONFIG_HOME/noctalia/templates/colors.lua";
            output_path = "$XDG_CONFIG_HOME/hypr/colors.lua";
            post_hook = "${lib.getExe reloadHook}";
          };
        };
      };

      # ----- Plugin Settings -----
      plugins = {
        enabled = [
          "noctalia/wallhaven"
          "noctalia/mpvpaper"
        ];
      };

      plugin_settings = {
        "noctalia/mpvpaper" = {
          video_directory = "${config.home.homeDirectory}/dotfiles/Wallpapers/Video";
        };

        # No one would still a little api_key for wallhaven, since it's free, surely :)
        "noctalia/wallhaven" = {
          api_key = "l83Zzc2Ti34fOKCTYLDHyIhmjNby17sD";
        };
      };

      # ----- Desktop Widget Settings -----
      desktop_widgets = {
        schema_version = 2;

        grid = {
          cell_size = 16;
          major_interval = 4;
          visible = true;
        };

        widget_order = [
          "desktop-widget-0000000000000001"
          "desktop-widget-0000000000000002"
          "desktop-widget-0000000000000003"
          "desktop-widget-0000000000000004"
          "desktop-widget-0000000000000005"
        ];

        widget = {
          desktop-widget-0000000000000001 = {
            box_height = 224.0;
            box_width = 512.0;
            cx = 3112.0;
            cy = 224.0;
            output = "DP-1";
            rotation = 0.0;
            type = "media_player";
            settings = {
              background = false;
              layout = "horizontal";
            };
          };

          desktop-widget-0000000000000002 = {
            box_height = 224.0;
            box_width = 512.0;
            cx = 320.0;
            cy = 224.0;
            output = "DP-1";
            rotation = 0.0;
            type = "weather";
            settings = {
              background = false;
              show_forecast = true;
            };
          };

          desktop-widget-0000000000000003 = {
            box_height = 144.0;
            box_width = 304.0;
            cx = 1720.0;
            cy = 144.0;
            output = "DP-1";
            rotation = 0.0;
            type = "clock";
            settings = {
              background = false;
              center_text = true;
              clock_style = "digital";
              shadow = true;
            };
          };

          desktop-widget-0000000000000004 = {
            box_height = 176.0;
            box_width = 512.0;
            cx = 3112.0;
            cy = 424.0;
            output = "DP-1";
            rotation = 0.0;
            type = "audio_visualizer";
            settings = {
              background = false;
              bands = 48;
              centered = true;
              color_1 = "primary";
              color_2 = "on_primary";
              mirrored = true;
              show_when_idle = true;
            };
          };

          desktop-widget-0000000000000005 = {
            box_height = 720.0;
            box_width = 688.0;
            cx = 3088.0;
            cy = 1080.0;
            output = "DP-1";
            rotation = 0.0;
            type = "sticker";
            settings = {
              background = false;
              image_path = "${config.home.homeDirectory}/dotfiles/Stickers/mahiro.png";
              opacity = 1.0;
            };
          };
        };
      };
    };
  };

  # --- Noctalia color switching and Vicinae re-theming alongside wallpaper changes ---

  xdg.configFile."noctalia/templates/vicinae.toml".text = ''
    [meta]
    version = 1
    name = "Palette"
    description = "Wallpaper based theme colors"
    variant = "dark"
    inherits = "vicinae-dark"

    [colors.core]
    accent = "{{colors.primary.default.hex}}"
    accent_foreground = "{{colors.on_primary.default.hex}}"
    background = "{{colors.surface.default.hex}}"
    foreground = "{{colors.on_surface.default.hex}}"
    secondary_background = "{{colors.surface_container.default.hex}}"
    border = "{{colors.outline_variant.default.hex}}"

    [colors.main_window]
    border = "{{colors.outline_variant.default.hex}}"

    [colors.settings_window]
    border = "{{colors.outline.default.hex}}"

    [colors.accents]
    blue = "{{colors.primary.default.hex}}"
    green = "{{colors.tertiary.default.hex}}"
    magenta = "{{colors.secondary.default.hex}}"
    red = "{{colors.error.default.hex}}"
    purple = "{{colors.secondary.default.hex}}"

    [colors.accents.orange]
    name = "{{colors.error.default.hex}}"
    lighter = 40

    [colors.accents.yellow]
    name = "{{colors.tertiary.default.hex}}"
    lighter = 80

    [colors.accents.cyan]
    name = "{{colors.primary.default.hex}}"
    lighter = 50

    [colors.text]
    default = "{{colors.on_surface.default.hex}}"
    muted = "{{colors.on_surface_variant.default.hex}}"
    danger = "{{colors.error.default.hex}}"
    success = "{{colors.tertiary.default.hex}}"

    [colors.text.placeholder]
    name = "{{colors.on_surface_variant.default.hex}}"
    opacity = 0.6

    [colors.text.selection]
    background = "{{colors.primary.default.hex}}"
    foreground = "{{colors.on_primary.default.hex}}"

    [colors.text.links]
    default = "{{colors.primary.default.hex}}"

    [colors.text.links.visited]
    name = "{{colors.tertiary.default.hex}}"
    darker = 20

    [colors.input]
    border = "{{colors.outline.default.hex}}"
    border_focus = "{{colors.primary.default.hex}}"
    border_error = "{{colors.error.default.hex}}"

    [colors.button.primary]
    background = "{{colors.surface_container_high.default.hex}}"
    foreground = "{{colors.on_surface.default.hex}}"

    [colors.button.primary.hover]
    background = "{{colors.surface_container_highest.default.hex}}"

    [colors.button.primary.focus]
    outline = "{{colors.primary.default.hex}}"

    [colors.list.item.hover]
    background = { name = "{{colors.primary_container.default.hex}}", opacity = 0.25 }
    foreground = "{{colors.on_surface.default.hex}}"

    [colors.list.item.selection]
    background = { name = "{{colors.primary_container.default.hex}}", opacity = 0.50 }
    foreground = "{{colors.on_primary_container.default.hex}}"
    secondary_background = "{{colors.primary_container.default.hex}}"
    secondary_foreground = "{{colors.on_primary_container.default.hex}}"

    [colors.grid.item]
    background = "{{colors.surface_container.default.hex}}"

    [colors.grid.item.hover.outline]
    name = "{{colors.secondary.default.hex}}"
    opacity = 0.8

    [colors.grid.item.selection.outline]
    name = "{{colors.primary.default.hex}}"

    [colors.scrollbars.background]
    name = "{{colors.primary.default.hex}}"
    opacity = 0.2

    [colors.loading]
    bar = "{{colors.primary.default.hex}}"
    spinner = "{{colors.primary.default.hex}}"
  '';

  xdg.configFile."noctalia/templates/colors.lua".text = ''
    hl.config({ 
      general = { 
        ["col.active_border"] = { 
          colors = { "rgb({{colors.primary.default.hex_stripped}})", "rgb({{colors.primary.default.hex_stripped}})" }, 
          angle = 45 
        } 
      } 
    })
  '';

  # Generates a mutable fallback file for Hyprland to read on first launch
  home.activation.hyprlandColors = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "${config.xdg.configHome}/hypr/colors.lua" ]; then
      echo 'hl.config({ general = { ["col.active_border"] = { colors = { "rgb(ffffff)", "rgb(ffffff)" }, angle = 45 } } })' \
        > "${config.xdg.configHome}/hypr/colors.lua"
    fi
  '';

  # Ensures Vicinae's directory exists for Noctalia to write the theme output
  home.file.".local/share/vicinae/themes/.keep".text = "";
}
