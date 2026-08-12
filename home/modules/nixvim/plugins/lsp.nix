{ ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      clangd.enable = true;
      nixd.enable = true;
      lua_ls.enable = true;
      pyright.enable = true;
      ruby_lsp.enable = true;
      html.enable = true;
      cssls.enable = true;
      ts_ls.enable = true;
      qmlls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };
}
