{ ... }:
{
  programs.nixvim.keymaps = [
    # Tabbing in visual mode
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }

    # Join line without moving cursor
    {
      mode = "n";
      key = "J";
      action = "mzJ`z";
    }

    # Move selection up/down
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }

    # Half-page movement, centered
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-u>zz";
    }

    # Keep search results centered
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
    }

    # Line start/end
    {
      mode = "n";
      key = ";";
      action = "^";
    }
    {
      mode = "n";
      key = "'";
      action = "$";
    }

    # Windows
    {
      mode = "n";
      key = "<leader>ww";
      action = "<C-w>p";
      options.desc = "Other window";
    }
    {
      mode = "n";
      key = "<leader>wd";
      action = "<C-w>c";
      options.desc = "Close window";
    }

    # Splits
    {
      mode = "n";
      key = "<leader>-";
      action = "<C-w>s";
      options.desc = "Split horizontal";
    }
    {
      mode = "n";
      key = "<leader>|";
      action = "<C-w>v";
      options.desc = "Split vertical";
    }

    # Buffers
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bd<cr>";
      options.desc = "Delete buffer";
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>bnext<cr>";
      options.desc = "Next buffer";
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>bprev<cr>";
      options.desc = "Prev buffer";
    }

    # Diagnostic navigation
    {
      mode = "n";
      key = "[d";
      action.__raw = "function() vim.diagnostic.jump({ count = -1, float = true }) end";
      options.desc = "Previous diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action.__raw = "function() vim.diagnostic.jump({ count = 1, float = true }) end";
      options.desc = "Next diagnostic";
    }

    # Control-S save + format
    {
      mode = [
        "n"
        "v"
        "i"
      ];
      key = "<C-s>";
      action.__raw = ''
        	function()
        	  vim.cmd("stopinsert")
        	  vim.lsp.buf.format({ async = false })
        	  vim.cmd("write")
        	end
      '';
      options = {
        desc = "Save and format";
        silent = true;
        noremap = true;
      };
    }
  ];
}
