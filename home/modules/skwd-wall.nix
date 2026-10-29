{ config, ... }:
{
  sops.templates."skwd-wall-config.json" = {
    path = "${config.xdg.configHome}/skwd-wall-v2/config.json";
    content = builtins.toJSON {
      components.wallpaperSelector = {
        displayMode = "slices";
        enabled = true;
        roundCorners = true;
        sliceParallax = true;
        sliceWobble = false;
      };

      filterBar = {
        show = {
          favourites = false;
          orient = false;
          random = false;
          sort = {
            minimalist = false;
            pop = false;
            res = false;
            richness = false;
          };
          type.we = false;
        };
        visualStyle = "match";
      };

      general = {
        applyOnPickerMonitor = true;
        locale = "Linköping";
        randomRotate = false;
      };

      library.folders = [
        "${config.home.homeDirectory}/dotfiles/Wallpapers"
      ];

      performance.imageOptimizeResolution = "4k";
      pickOnlyMode = false;

      playback = {
        fullscreen = true;
        muteOnOtherAudio = false;
      };

      schedule = {
        latitude = "58.41086";
        longitude = "15.62157";
      };

      sources = {
        pexels.enabled = true;
        unsplash.enabled = true;
      };

      theme = {
        authority = "skwd";
        engine = "skwd-iris";
        mode = "dark";
        policy = "wallpaper";
        scheme = "tonal-spot";
        targets = [
          "noctalia"
        ];
      };

      transition = {
        durationMs = 600;
        fps = 60;
        previewFps = 60;
        shader = "iris";
      };

      wallhaven = {
        apiKey = config.sops.placeholder.wallhaven_api_key;
        defaults = {
          atleast = "";
          sketchy = true;
        };
        username = "irisphere";
      };

      wallpaperVolume = 0;
      weRender.scaling = "default";
      weather.source = "semantic";
    };
  };
}
