{ self, inputs, ... }:
{
  flake.nixosModules.openssh = {
    services.openssh = {
      enable = true;
      openFirewall = false;
      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    users.users.iris.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOpEVShZyyFquW3gp7UhJpN/LTAW49GyZ2HHKLLKAAEO iris@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChll3FW4oj9STkA//o9rco7toNL/gpsIW239vKl1j9G iris@desktop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF5De13KN8x9n5X/V8RXKeeONZkUgv+NTKpp8HKSyVyv iris@school"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDyu4EU7ZwupmmVHTDrQy6ItAeFlkYlzD5am6JGBT02f iris@phone"
    ];
  };
}
