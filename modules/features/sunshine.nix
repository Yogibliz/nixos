{ self, inputs, ... }:
{
  flake.nixosModules.sunshine =
    { pkgs, lib, ... }:
    let
      # Direct port of the script from the Umbriel docs
      umbrielOutput = pkgs.writeShellScript "umbriel-output" ''
        set -eu

        name=sunshine

        case "$1" in
          create)
            umbriel output-destroy "$name" >/dev/null 2>&1 || true
            umbriel output-create "$name" \
              "''${SUNSHINE_CLIENT_WIDTH:-1920}x''${SUNSHINE_CLIENT_HEIGHT:-1080}@''${SUNSHINE_CLIENT_FPS:-60}" >/dev/null
            ;;
          remove)
            i=0
            while [ "$i" -lt 25 ]; do
              left="$(umbriel windows --json |
                jq --arg out "$name:" '[.[] | select(.workspace | startswith($out))] | length')"
              [ "$left" = 0 ] && break
              sleep 0.2
              i=$((i + 1))
            done

            target="$(umbriel workspaces --json |
              jq -r --arg out "$name" '[.[] | select(.output != $out and .active)]
                | (map(select(.focused)) + .) | first | "\(.name)/\(.output)" // empty')"

            for id in $(umbriel windows --json |
              jq -r --arg out "$name:" '.[] | select(.workspace | startswith($out)) | .id'); do
              [ -n "$target" ] || break
              umbriel msg window-focus "$id"
              umbriel msg window-move-to-workspace-silent "$target"
            done

            umbriel output-destroy "$name" >/dev/null 2>&1 || true
            ;;
        esac
      '';
    in
    {
      services.sunshine = {
        enable = true;
        openFirewall = true;
        capSysAdmin = false;
        # Started from Umbriel instead (see below) so it inherits the compositor's
        # Wayland/IPC environment, which the session script needs.
        autoStart = false;

        settings = {
          capture = "wlr";
          output_name = "sunshine";
          global_prep_cmd = builtins.toJSON [
            {
              "do" = "${umbrielOutput} create";
              "undo" = "${umbrielOutput} remove";
            }
          ];
        };

        applications.apps = [
          {
            name = "Steam Big Picture";
            detached = [ "steam steam://open/bigpicture" ];
            prep-cmd = [
              {
                "do" = "";
                "undo" = "steam steam://close/bigpicture";
              }
            ];
            image-path = "steam.png";
          }
        ];
      };
    };
}
