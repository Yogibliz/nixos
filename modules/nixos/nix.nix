{ self, inputs, ... }:
{
  flake.nixosModules.nix = {
    nix = {
      settings = {
        experimental-features = [
          "nix-command"
          "flakes"
        ];
        trusted-users = [ "iris" ];
      };

      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 1d";
      };
    };
  };
}
