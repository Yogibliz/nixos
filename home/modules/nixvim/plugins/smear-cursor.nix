{ ... }:
{
  programs.nixvim.plugins.smear-cursor = {
    enable = true;
    settings = {
      stiffness = 0.8;
      trailing_stiffness = 0.5;
    };
  };
}
