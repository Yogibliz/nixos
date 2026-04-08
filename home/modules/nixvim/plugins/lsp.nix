{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      lua_ls.enable = true;
      rust_analyzer = {
        enable = true;
        installCargo = false;
        installRustc = false;
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    nixd
  ];
}
