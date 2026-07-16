{
  pkgs,
  config,
  lib,
  ...
}:
{
  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "DP-3";
      mode = "1920x1080@144";
      position = "0x0";
      scale = 1;
      transform = 3;
    }
    {
      output = "DP-2";
      mode = "3440x1440@175";
      position = "1080x0";
      scale = 1;
    }
    {
      output = "DP-1";
      mode = "1920x1080@144";
      position = "4520x0";
      scale = 1;
    }
    {
      output = "HDMI-A-1";
      mode = "3840x2160@120";
      position = "6440x0";
      scale = 1.5;
      disabled = true;
    }
  ];

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
