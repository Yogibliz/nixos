{ self, inputs, ... }:
{
  flake.nixosModules.system = {
    system = {
      # No touchy!
      stateVersion = "25.11"; # Bad girl, no touching!!!
    };
  };
}
