{ ... }:
{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "default";
        "<Tab>" = [
          "accept"
          "fallback"
        ];
        "<CR>" = [ "fallback" ];
      };
    };
  };
}
