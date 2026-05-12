{ self, inputs, ... }:
{
  flake.nixosModules.steam =
    { pkgs, ... }:
    {
      # Millennium
      nixpkgs.overlays = [ inputs.millennium.overlays.default ];

      # Steam
      programs.steam = {
        enable = true;
        # Broken temp
        # package = pkgs.millennium-steam;
        package = pkgs.steam;
        gamescopeSession.enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
        extraCompatPackages = [ pkgs.proton-ge-bin ];
      };

      # Gamescope
      programs.gamescope = {
        enable = true;
        capSysNice = true;
      };

      # XWayland for Steam
      programs.xwayland.enable = true;
    };
}
