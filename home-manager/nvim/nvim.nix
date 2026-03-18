# ── Neovim ────────────────────────────────────────────────
{
  config,
  lib,
  pkgs,
  lazyvim,
  ...
}: {
  imports = [lazyvim.homeManagerModules.default];
  programs.lazyvim = {
    enable = true;

    extras = {
      lang.nix.enable = true;
    };

    extraPackages = with pkgs; [
      # Nix
      nixd
      alejandra

      # Lua
      lua
      luarocks
      lua-language-server
      stylua

      # C/C++
      gcc

      # Rust
      rustc
      cargo

      # LaTeX
      texliveMedium
      zathura

      # Others
      fzf
      statix
      ripgrep
      ast-grep
    ];

    # Your lua config files, same structure as before
    configFiles = ./lua;

    # Or inline if you prefer:
    # config = {
    #   options = builtins.readFile ./lua/config/options.lua;
    #   keymaps = builtins.readFile ./lua/config/keymaps.lua;
    # };
  };
}
