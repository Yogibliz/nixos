{ pkgs, config, ... }:
{
  wayland.windowManager.hyprland.settings.monitor = [
    {
      output = "DP-2";
      mode = "1920x1080@144";
      position = "0x0";
      scale = 1;
      transform = 3;
    }
    {
      output = "DP-1";
      mode = "3440x1440@175";
      position = "1080x0";
      scale = 1;
    }
    {
      output = "DP-3";
      mode = "1920x1080@144";
      position = "4520x0";
      scale = 1;
    }
    {
      output = "HDMI-A-1";
      mode = "3840x2160@120";
      position = "6440x0";
      scale = 1.5;
    }
  ];

  # wayland.windowManager.hyprland.settings.monitor = [
  #   "DP-2, 1920x1080@144, 0x0, 1, transform, 3"
  #   "DP-1, 3440x1440@175, 1080x0, 1"
  #   "DP-3, 1920x1080@144, 4520x0, 1"
  #   "HDMI-A-1, 3840x2160@120, 6440x0, 1.5"
  # ];

  home.packages = with pkgs; [
    openssl_3_5
    artix-games-launcher
  ];

  home.file.".config/Artix Game Launcher/Pepper Data/Shockwave Flash/WritableRoot/#SharedObjects/UFVPF3WA/game.aq.com/AQLite_Data.sol" =
    {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/home/modules/artix-launcher/AQLite_Data.sol";
    };
}
