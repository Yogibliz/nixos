# ── Neovim ────────────────────────────────────────────────
{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.lazyvim.homeManagerModules.default];
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

      # Others
      ripgrep
      ast-grep
    ];

    # Lua config files
    configFiles = ./lua;
  };
}
