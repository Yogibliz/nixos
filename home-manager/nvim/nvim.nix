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
      nixd
      alejandra
      lua-language-server
      stylua
      ripgrep
      ast-grep
      fzf
      lua
      gcc
      rustc
      cargo
      texliveMedium
      zathura
      luarocks
      statix
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
