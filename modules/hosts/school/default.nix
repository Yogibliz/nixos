{ self, inputs, ... }:
{
  flake.nixosConfigurations.school = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.schoolConfiguration
    ];
  };
}
