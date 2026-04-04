{...}: {
  programs.nixvim.plugins.fzf-lua = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    # <leader><leader> = find files in cwd (lazyvim style)
    { mode = "n"; key = "<leader><leader>"; action = "<cmd>FzfLua files<cr>"; options.desc = "Find files"; }

    # <leader>f group
    { mode = "n"; key = "<leader>ff"; action = "<cmd>FzfLua files<cr>"; options.desc = "Find files"; }
    { mode = "n"; key = "<leader>fg"; action = "<cmd>FzfLua live_grep<cr>"; options.desc = "Live grep"; }
    { mode = "n"; key = "<leader>fb"; action = "<cmd>FzfLua buffers<cr>"; options.desc = "Find buffers"; }
    { mode = "n"; key = "<leader>fr"; action = "<cmd>FzfLua oldfiles<cr>"; options.desc = "Recent files"; }
    { mode = "n"; key = "<leader>fc"; action = "<cmd>FzfLua grep_cword<cr>"; options.desc = "Find word under cursor"; }

    # <leader>/ = grep in current buffer
    { mode = "n"; key = "<leader>/"; action = "<cmd>FzfLua blines<cr>"; options.desc = "Search in buffer"; }
  ];
}
