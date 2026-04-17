{ ... }:
{
  programs.nixvim.plugins.lazygit = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit";
    }
  ];
}
