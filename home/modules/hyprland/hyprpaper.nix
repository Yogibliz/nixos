{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = [
        # Set random wallpaper from folder, random for each display.
        {
          monitor = "";
          path = "~/Wallpaper";
        }
      ];
    };
  };
}
