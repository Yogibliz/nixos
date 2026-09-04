{ ... }:
{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    texlivePackage = null;
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
    {
      mode = "n";
      key = "<localleader>lb";
      action = {
        __raw = ''
          	  function()
          	      -- Ensure this only runs in tex files
          	      if vim.bo.filetype ~= 'tex' then return end

          	      local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)[1]
          	      local xe_shebang = "% !TeX program = xelatex"
          	      local pdf_shebang = "% !TeX program = pdflatex"

          	      if first_line == xe_shebang then
          		vim.api.nvim_buf_set_lines(0, 0, 1, false, {pdf_shebang})
          	      elseif first_line == pdf_shebang then
          		vim.api.nvim_buf_set_lines(0, 0, 1, false, {xe_shebang})
          	      else
          		vim.api.nvim_buf_set_lines(0, 0, 0, false, {xe_shebang})
          	      end
          	   end
          	'';
      };
      options.desc = "Create/Swap Shebang (xelatex/pdflatex)";
    }
  ];
}
