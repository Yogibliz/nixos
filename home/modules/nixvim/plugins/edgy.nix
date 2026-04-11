{ ... }:
{
  programs.nixvim.plugins.edgy = {
    enable = true;
    settings = {
      left = [
        {
          ft = "NvimTree";
          size = 30;
          title = "nvimtree";
        }
      ];
      bottom = [
        {
          ft = "toggleterm";
          size = 20;
          title = "Terminal";
        }
      ];
    };
  };
}
