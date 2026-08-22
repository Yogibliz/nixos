{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.caelestia-shell.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = false;
    package = pkgs.caelestia-shell;
    settings = {
      paths = {
        wallpaperDir = "~/dotfiles/Wallpapers/";
      };
      background = {
        desktopClock = {
          enabled = true;
          position = "top-center";
          background = {
            enabled = true;
          };
        };
        visualiser = {
          enabled = true;
          autoHide = true;
          blur = true;
        };
      };
      bar = {
        activeWindow = {
          compact = true;
        };
        tray = {
          compact = true;
        };
        clock = {
          background = true;
          showDate = true;
        };
      };
      launcher = {
        actionPrefix = "<";
        enableDangerousActions = true;
        vimKeybinds = true;
      };
    };
    cli = {
      enable = true;
      package = pkgs.caelestia-cli;
      settings = {

      };
    };
  };
}
