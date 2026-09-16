{ ... }:
{
  programs.nixvim.plugins.markview = {
    enable = true;

    settings = {
      preview = {
        enable = true;
      };
    };
  };
}
