{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native.enable = true;
    };
  };

  programs.nixvim.keymaps = [
    # <leader><leader> = find files in cwd (lazyvim style)
    {
      mode = "n";
      key = "<leader><leader>";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Find files";
    }

    # <leader>f group
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Live grep";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options.desc = "Recent files";
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>Telescope grep_string<cr>";
      options.desc = "Find word under cursor";
    }

    # <leader>/ = grep in current buffer
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>Telescope current_buffer_fuzzy_find<cr>";
      options.desc = "Search in buffer";
    }
  ];
}
