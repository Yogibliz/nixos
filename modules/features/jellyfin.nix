{ self, ... }:
{
  flake.nixosModules.jellyfin =
    { pkgs, ... }:
    {
      services.jellyfin = {
        enable = true;
        user = "iris";
      };

      home-manager.users.iris.home.packages = with pkgs; [
        jellyfin
        jellyfin-web
        jellyfin-ffmpeg
      ];
    };
}
