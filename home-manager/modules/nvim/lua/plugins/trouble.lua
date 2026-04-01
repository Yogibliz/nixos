return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {
    {
      modes = {
        test = {
          mode = "diagnostics",
          preview = {
            type = "split",
            relative = "win",
            position = "right",
            size = 0.3,
          },
        },
      },
    },
  },
}
