{ ... }:
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

  programs.nixvim.extraConfigLua = ''
    vim.env.PATH = "/etc/profiles/per-user/iris/bin:" .. vim.env.PATH
  '';

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<localleader>lw";
      action = "<cmd>VimtexCountWords<CR>";
      options.desc = "Count Words";
    }
  ];
}
