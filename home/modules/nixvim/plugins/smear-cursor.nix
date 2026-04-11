{ ... }:
{
  programs.nixvim.plugins.smear-cursor = {
    enable = true;
    settings = {
      stiffness = 0.6;
      trailing_stiffness = 0.45;
      distance_stop_animating = 0.1;
    };
  };
}
