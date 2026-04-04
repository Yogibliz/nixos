{ pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_format = "fallback";
      };
      formatters_by_ft = {
        nix = [ "nixfmt" ];
        lua = [ "stylua" ];
        rust = [ "rustfmt" ];
        python = [ "black" ];
        "_" = [ "trim_whitespace" ];
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    nixfmt
    stylua
    rustfmt
  ];
}
