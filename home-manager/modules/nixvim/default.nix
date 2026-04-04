{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim.nix
    ./clipboard.nix
    ./colorscheme.nix
    ./keymaps.nix
    ./plugins/blink.nix
    ./plugins/conform.nix
    ./plugins/icons.nix
    ./plugins/lazygit.nix
    ./plugins/lsp.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    ./plugins/vimtex.nix
    ./plugins/which-key.nix
  ];
}
