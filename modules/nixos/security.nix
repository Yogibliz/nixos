{ self, inputs, ... }:
{
  flake.nixosModules.security =
    { pkgs, ... }:
    {
      programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = false;
        pinentryPackage = pkgs.pinentry-curses;
      };
      security = {
        rtkit.enable = true;
        wrappers.fusermount3 = {
          setuid = true;
          owner = "root";
          group = "root";
          source = "${pkgs.fuse3}/bin/fusermount3";
        };
      };
    };
}
