{ self, inputs, ... }:
{
  flake.nixosConfigurations.school = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs self; };

    modules = [
      self.nixosModules.schoolConfiguration
    ];
  };
}
