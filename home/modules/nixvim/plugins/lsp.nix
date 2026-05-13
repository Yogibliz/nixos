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
      qmlls = {
        enable = true;
        cmd = [ "${pkgs.kdePackages.qtdeclarative}/bin/qmlls" ];
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    nixd
    kdePackages.qtdeclarative
  ];
}
