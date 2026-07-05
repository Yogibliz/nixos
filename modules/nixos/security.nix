{ self, inputs, ... }:
{
  flake.nixosModules.security =
    { pkgs, ... }:
    {
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
