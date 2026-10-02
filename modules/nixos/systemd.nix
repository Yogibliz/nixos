{ self, inputs, ... }:
{
  flake.nixosModules.systemd =
    { lib, ... }:
    {
      systemd = {
        user.sessionVariables.PROTON_PASS_LINUX_KEYRING = "dbus";
        services = {
          NetworkManager-wait-online.enable = false;
          jellyfin = {
            wants = lib.mkForce [ ];
            after = lib.mkForce [ "network.target" ];
          };
        };
      };
    };
}
