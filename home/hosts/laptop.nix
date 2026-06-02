{ pkgs, ... }:
{
  xdg.configFile."hypr/monitors.lua".text = ''
         hl.config({
          monitor = {
          {
            output = "";
    	mode = "preferred";
    	position = "auto";
    	scale = 1;
          
          },
         })
  '';

  home.packages = with pkgs; [
    openssl_3_5
    libva-utils
    mission-center
    artix-games-launcher
  ];
}
