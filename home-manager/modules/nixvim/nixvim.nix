{
  pkgs,
  inputs,
  ...
}: {
  programs.nixvim = {
    enable = true;
    package = inputs.nixvim.packages.${pkgs.stdenv.hostPlatform.system}.default;

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };

    colorschemes = {
      # gruvbox.enable = true;
      catppuccin.enable = true;
    };

    plugins = {
      lightline.enable = true;
    };
  };
}
