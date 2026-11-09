{ pkgs, ... }:
{
  programs.nixvim.filetype.extension = {
    cc = "cpp";
    cpp = "cpp";
    h = "cpp";
    tcc = "cpp";
  };

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
        qml = [ "qmlformat" ];
        c = [ "clang_format" ];
        cpp = [ "clang_format" ];
        "_" = [ "trim_whitespace" ];
      };

      formatters = {
        qmlformat = {
          command = "${pkgs.kdePackages.qtdeclarative}/bin/qmlformat";
          args = [
            "--inplace"
            "$FILENAME"
          ];
          stdin = false;
        };

        clang_format = {
          prepend_args = [
            "--style={
	      BasedOnStyle: LLVM,
	      IndentWidth: 2,
	      BreakBeforeBraces: Allman,
	      BreakTemplateDeclarations: Yes,
	      SpaceBeforeAssignmentOperators: true,
	      RequiresClausePosition: WithPreceding
	    }"
          ];
        };
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    black
    nixfmt
    stylua
    rustfmt
    clang-tools
    kdePackages.qtdeclarative
  ];
}
