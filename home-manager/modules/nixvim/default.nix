{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./nixvim.nix
    ./clipboard.nix
    ./colorscheme.nix  
    ./plugins/blink.nix
    ./plugins/conform.nix
    ./plugins/lsp.nix
    ./plugins/trouble.nix
    ./plugins/vimtex.nix
  ];
}
