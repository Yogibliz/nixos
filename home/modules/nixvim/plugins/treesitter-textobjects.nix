{ ... }:
{
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;
    settings = {
      lookahead = true;
    };
  };
}
