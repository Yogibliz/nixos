{ pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        	function(bufnr)
        	  local bufname = vim.api.nvim_buf_get_name(bufnr)

        	  if bufname:match("keymaps.nix") then
        	    return
        	  end

        	  return { timeout_ms = 500, lsp_format = "fallback" }
        	end
      '';
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
    black
    nixfmt
    stylua
    rustfmt
  ];
}
