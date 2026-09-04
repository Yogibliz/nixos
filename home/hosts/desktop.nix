{
  pkgs,
  config,
  lib,
  ...
}:
{
  programs.umbriel.settings = {
    layout = {
      mode = "dwindle";
    };

    workspace = [
      {
        index = 1;
        output = "DP-2";
        layout = {
          mode = "scrolling";
        };
      }
    ];

    output = {
      DP-3 = {
        mode = "1920x1080@144";
        position = [
          0
          0
        ];
        transform = "270";
      };
      DP-2 = {
        mode = "3440x1440@175";
        hdr = "auto";
        position = [
          1080
          0
        ];
      };
      DP-1 = {
        mode = "1920x1080@144";
        position = [
          4520
          0
        ];
      };
      HDMI-A-1 = {
        mode = "3840x2160@120";
        position = [
          6440
          0
        ];
        scale = 1.5;
        enabled = true;
      };
    };
  };

  home.packages = with pkgs; [
    openssl_3_5
    artix-games-launcher
    mission-center
  ];

  home.activation = {
    linkAQLiteData =
      let
        targetDir = "${config.home.homeDirectory}/.config/Artix Game Launcher/Pepper Data/Shockwave Flash/WritableRoot/#SharedObjects/UFVPF3WA/game.aq.com";
        sourceDir = "${config.home.homeDirectory}/dotfiles/home/modules/artix-launcher/game.aq.com";
      in
      lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        mkdir -p "${sourceDir}"
        mkdir -p "$(dirname "${targetDir}")"
        if [ -e "${targetDir}" ] || [ -L "${targetDir}" ]; then
          rm -rf "${targetDir}"
        fi
        ln -s "${sourceDir}" "${targetDir}"
      '';
  };
}
