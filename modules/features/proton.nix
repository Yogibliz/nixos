{ self, ... }:
{
  flake.nixosModules.proton =
    { ... }:
    {
      # Apps
      programs = {
        proton-vpn.enable = true;
        proton-pass.enable = true;
        proton-authenticator = true;
        protonmail-desktop = true;
      };
    };
}
