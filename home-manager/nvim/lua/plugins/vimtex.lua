return {
  "lervag/vimtex",
  lazy = false,
  keys = {
    { "<localleader>lw", "<cmd>VimtexCountWords<CR>", desc = "Count Words", ft = "tex" },
  },
  init = function()
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_compiler_latexmk = {
      build_dir = "",
      callback = 1,
      continuous = 1,
      executable = "latexmk",
      hooks = {},
      options = {
        "-verbose",
        "-file-line-error",
        "-synctex=1",
        "-interaction=nonstopmode",
        "-shell-escape",
      },
    }
    vim.g.vimtex_view_method = "zathura"
  end,
}
