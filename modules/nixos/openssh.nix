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

    # Have to add these per machine when I use them.
    users.users.iris.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOpEVShZyyFquW3gp7UhJpN/LTAW49GyZ2HHKLLKAAEO iris@laptop"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIChll3FW4oj9STkA//o9rco7toNL/gpsIW239vKl1j9G iris@desktop"
      "ssh-ed25519 AAAA... iris@school"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDyu4EU7ZwupmmVHTDrQy6ItAeFlkYlzD5am6JGBT02f iris@phone"
    ];
  };
}
