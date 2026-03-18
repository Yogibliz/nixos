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

    # Lua config files
    configFiles = ./lua;
  };
}
