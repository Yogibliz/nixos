{ pkgs, ... }:
{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    settings = {
      view_method = "zathura";
      compiler_method = "latexmk";
      compiler_latexmk = {
        build_dir = "";
        callback = 1;
        continuous = 1;
        executable = "latexmk";
        hooks = [ ];
        engine = "-xelatex";
        options = [
          "-verbose"
          "-file-line-error"
          "-synctex=1"
          "-interaction=nonstopmode"
          "-shell-escape"
        ];
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    texliveFull
    zathura
  ];

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<localleader>lw";
      action = "<cmd>VimtexCountWords<CR>";
      options.desc = "Count Words";
    }
  ];
}
