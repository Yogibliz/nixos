{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    hyprland.url = "github:hyprwm/Hyprland/v0.54.2?submodules=1";
  };

  outputs = {
    self,
    nixpkgs,
    hyprland,
    ...
  }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inputs = {inherit hyprland;};};
      modules = [
        hyprland.nixosModules.default
        ./configuration.nix
      ];
    };
  };
}
