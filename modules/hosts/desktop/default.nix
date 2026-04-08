{ self, inputs, ... }:
{
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = { inherit inputs self; };

    modules = [
      self.nixosModules.desktopConfiguration
    ];
  };
}
