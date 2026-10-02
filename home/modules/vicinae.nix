{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;

  # Renamed to proton-pass-ext and cleanly isolated
  proton-pass-ext =
    pkgs.fetchFromGitHub {
      owner = "raycast";
      repo = "extensions";
      rev = "7e67bdb0eb90315c17c07ebd696fd5abdc2a021a";
      hash = "sha256-GJHYhLBulHj4r/QUDqRGVLdxpGSXBW5mTJgXCnbJzhQ=";
      sparseCheckout = [ "extensions/proton-pass" ];
    }
    + "/extensions/proton-pass";

  patched-proton-pass-src = pkgs.runCommand "patched-proton-pass-src" { } ''
    mkdir -p $out
    cp -r ${proton-pass-ext}/* $out/
    chmod -R +w $out

    find $out -type f \( -name "*.ts" -o -name "*.tsx" -o -name "*.js" \) -exec sed -i \
      -e 's/platform !== "darwin"/false/g' \
      -e 's/platform !== "win32"/false/g' \
      -e 's/platform === "darwin"/true/g' \
      -e 's/platform === "win32"/true/g' \
      -e 's/process\.platform/\"darwin\"/g' \
      -e 's/process\.env\.OS/\"darwin\"/g' {} +
  '';

  proton-pass-extension = inputs.vicinae.lib.${system}.mkRayCastExtension {
    name = "proton-pass";
    src = patched-proton-pass-src;
  };
in
{
  imports = [ inputs.vicinae.homeManagerModules.default ];

  home.activation = {
    linkProtonPassCli = inputs.home-manager.lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      $DRY_RUN_CMD mkdir -p $HOME/.local/share/vicinae/support/proton-pass/cli/2.3.3/
      $DRY_RUN_CMD rm -f $HOME/.local/share/vicinae/support/proton-pass/cli/2.3.3/pass-cli
      $DRY_RUN_CMD ln -sf ${pkgs.lib.getExe pkgs.proton-pass-cli} $HOME/.local/share/vicinae/support/proton-pass/cli/2.3.3/pass-cli
    '';
  };

  programs.vicinae = {
    enable = true;
    package = pkgs.vicinae;
    systemd = {
      enable = true;
      autoStart = true;
    };

    settings = {
      favorites = [
        "application:Warframe"
        "application:zen-twilight"
        "application:discord"
        "application:ArtixGamesLauncher"
        "application:SONE"
        "application:steam"
      ];

      providers = {
        "@izyuumi/proton-pass" = {
          entrypoints = {
            "search-items" = {
              alias = "pp";
            };
            "generate-password" = {
              alias = "gp";
            };
          };
        };

        "browser-extension" = {
          enabled = false;
        };
        "core" = {
          enabled = false;
        };
        "developer" = {
          enabled = false;
        };
        "files" = {
          enabled = true;
        };
        "font" = {
          enabled = false;
        };
        "manage-shortcuts" = {
          enabled = false;
        };
        "media" = {
          enabled = false;
        };
        "snippets" = {
          enabled = false;
        };
        "theme" = {
          enabled = false;
        };
        "wm" = {
          enabled = false;
        };

        "raycast-compat" = {
          enabled = true;
          entrypoints = {
            "store" = {
              enabled = false;
            };
          };
        };

        "power" = {
          entrypoints = {
            "hibernate" = {
              enabled = false;
            };
            "lock" = {
              enabled = false;
            };
            "power-off" = {
              enabled = true;
            };
            "reboot" = {
              enabled = true;
            };
            "sleep" = {
              enabled = true;
            };
            "soft-reboot" = {
              enabled = false;
            };
            "suspend" = {
              enabled = false;
            };
          };
        };
      };
    };

    extensions = [
      proton-pass-extension
    ];
  };
}
