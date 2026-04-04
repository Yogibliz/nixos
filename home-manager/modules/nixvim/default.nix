{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins/blink.nix
    ./plugins/conform.nix
    ./plugins/fzf-lua.nix
    ./plugins/icons.nix
    ./plugins/lsp.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/vimtex.nix
    ./plugins/which-key.nix
  ];
}
