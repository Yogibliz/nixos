{ ... }:
{
  programs.nixvim.plugins.barbar = {
    enable = true;
    settings = {
      animation = true;
      highlight_alternate = true;
      icons = {
        button = false;
        seperator_at_end = false;
      };
    };
  };
}
