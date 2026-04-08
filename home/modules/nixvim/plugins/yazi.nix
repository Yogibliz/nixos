{ ... }:
{
  programs.nixvim.plugins.yazi = {
    enable = true;
    settings = {
      floating_window_scaling_factor = 0.5;
      open_for_directories = true;
      yazi_floating_window_border = "single";
      yazi_floating_window_winblend = 50;
    };
  };
}
