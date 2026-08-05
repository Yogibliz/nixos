{ ... }:
{
  programs.nixvim.keymaps = [
    # Tabbing in visual mode
    { mode = "v"; key = ">"; action = ">gv"; }
    { mode = "v"; key = "<"; action = "<gv"; }

    # Join line without moving cursor
    { mode = "n"; key = "J"; action = "mzJ`z"; }

    # Move selection up/down
    { mode = "v"; key = "J"; action = ":m '>+1<CR>gv=gv"; }
    { mode = "v"; key = "K"; action = ":m '<-2<CR>gv=gv"; }

    # Half-page movement, centered
    { mode = "n"; key = "<A-j>"; action = "<C-d>zz"; }
    { mode = "n"; key = "<A-k>"; action = "<C-u>zz"; }

    # Keep search results centered
    { mode = "n"; key = "n"; action = "nzzzv"; }
    { mode = "n"; key = "N"; action = "Nzzzv"; }

    # Line start/end
    { mode = "n"; key = ";"; action = "^"; }
    { mode = "n"; key = "'"; action = "$"; }

    # Close Window
    { mode = "n"; key = "<leader>wd"; action = "<C-w>c"; options.desc = "Close window"; }

    # Window Movement
    { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.desc = "Move to left window"; }
    { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.desc = "Move to window below"; }
    { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.desc = "Move to window above"; }
    { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.desc = "Move to right window"; }

    # Window Resize
    { mode = "n"; key = "<C-Left>"; action = "<cmd>vertical resize -2<cr>"; options.desc = "Decrease Window Width"; }
    { mode = "n"; key = "<C-Down>"; action = "<cmd>resize -2<cr>"; options.desc = "Decrease Window Height"; }
    { mode = "n"; key = "<C-Up>"; action = "<cmd>resize +2<cr>"; options.desc = "Increase Window Height"; }
    { mode = "n"; key = "<C-Right>"; action = "<cmd>vertical resize +2<cr>"; options.desc = "Increase Window Width"; }

    # Splits
    { mode = "n"; key = "<leader>-"; action = "<C-w>s"; options.desc = "Split horizontal"; }
    { mode = "n"; key = "<leader>|"; action = "<C-w>v"; options.desc = "Split vertical"; }

    # Buffers
    { mode = "n"; key = "<leader>bd"; action = "<cmd>bd<cr>"; options.desc = "Delete buffer"; }
    { mode = "n"; key = "<leader>bn"; action = "<cmd>bnext<cr>"; options.desc = "Next buffer"; }
    { mode = "n"; key = "<leader>bp"; action = "<cmd>bprev<cr>"; options.desc = "Prev buffer"; }

    # Neotree
    { mode = "n"; key = "<leader>e"; action = "<cmd>Neotree toggle<cr>"; options.desc = "Toggle file explorer"; }
    { mode = "n"; key = "<leader>fe"; action = "<cmd>Neotree reveal<cr>"; options.desc = "Reveal current file in explorer"; }

    # Search and replace (regex)
    { mode = [ "n" "v" ]; key = "<C-S-/>"; action = ":%s/\\v//gc<Left><Left><Left><Left>"; options = { desc = "Search and replace (regex)"; noremap = true; }; }

    # Goto commands
    { mode = "n"; key = "gd"; action = "<cmd>Telescope lsp_definitions<cr>"; options.desc = "Go to definition"; }
    { mode = "n"; key = "gr"; action = "<cmd>Telescope lsp_references<cr>"; options.desc = "Go to references"; }

    # --------------------------------------------------- Function Keybinds ---------------------------------------------------

    # Invert True/False
    {
      mode = "n";
      key = "<leader>t";
      action.__raw = ''
        function()
          local cword = vim.fn.expand("<cword>"):lower()
          if cword == "true" then
            vim.cmd("normal! ciwfalse")
          elseif cword == "false" then
            vim.cmd("normal! ciwtrue")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Invert true/false under cursor";
      };
    }

    # Hover documentation
    { 
      mode = "n"; 
      key = "K";  
      action.__raw = ''
	function() 
	  vim.lsp.buf.hover()
	end
      '';
      options.desc = "Hover documentation";
    }

    # Rename
    { 
      mode = "n"; 
      key = "<leader>rn"; 
      action.__raw = ''
	function() 
	  vim.lsp.buf.rename()
	end
      ''; 
      options.desc = "Rename symbol";
    }


    # Diagnostic navigation
    { 
      mode = "n"; 
      key = "[d"; 
      action.__raw = ''
	function() 
	  vim.diagnostic.jump({ count = -1, float = true }) 
	end
      ''; 
      options.desc = "Previous diagnostic";
    }
    { 
      mode = "n"; 
      key = "]d"; 
      action.__raw = ''
	function() 
	  vim.diagnostic.jump({ count = 1, float = true }) 
	end 
      '';
      options.desc = "Next diagnostic"; 
    }

    # Control-S save + format
    {
      mode = [ "n" "v" "i" ];
      key = "<C-s>";
      action.__raw = ''
	function()
	  vim.cmd("stopinsert")
	  local bufname = vim.api.nvim_buf_get_name(0)
	  if not bufname:match("keymaps.nix") then
	    require("conform").format({ async = false, lsp_format = "fallback" })
	  end
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
