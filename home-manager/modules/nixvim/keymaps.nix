{...}: {
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
    { mode = "n"; key = "<C-j>"; action = "<C-d>zz"; }
    { mode = "n"; key = "<C-k>"; action = "<C-u>zz"; }

    # Keep search results centered
    { mode = "n"; key = "n"; action = "nzzzv"; }
    { mode = "n"; key = "N"; action = "Nzzzv"; }

    # Line start/end
    { mode = "n"; key = ";"; action = "^"; }
    { mode = "n"; key = "'"; action = "$"; }

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
  ];
}
