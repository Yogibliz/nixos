{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes = {
      # catppuccin.enable = true;
      rose-pine.enable = true;
    };

    plugins = {
      blink-cmp.enable = true;
      conform-nvim.enable = true;
      lightline.enable = true;
      lsp.enable = true;
      nix.enable = true;
      trouble.enable = true;
      vimtex.enable = true;
    };
  };
}
