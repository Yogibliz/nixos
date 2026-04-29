{ self, ... }:
{
  flake.nixosModules.proton =
    { pkgs, ... }:
    {
      # Apps
      home-manager.users.iris.home.packages = with pkgs; [
        proton-vpn
        proton-pass
        protonmail-desktop
      ];
    };
}
