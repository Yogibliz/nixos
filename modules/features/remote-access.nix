{ self, inputs, ... }:
{
  flake.nixosModules.remoteAccess =
    { ... }:
    {
      networking.interfaces.enp9s0.wakeOnLan.enable = true;

      services.openssh = {
        enable = true;
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
        };
      };

      users.users.iris.openssh.authorizedKeys.keys = [
        ""
      ];

      services.tailscale.enable = true;
      networking.firewall.trustedInterfaces = [ "tailscale0" ];
    };
}
