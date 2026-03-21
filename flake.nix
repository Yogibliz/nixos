{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland/v0.54.2?submodules=1";

    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.54.2";
      inputs.hyprland.follows = "hyprland";
    };

    hyprshell = {
      url = "github:H3rmt/hyprshell?ref=hyprshell-release";
      inputs.hyprland.follows = "hyprland";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";

    ashell = {
      url = "github:MalpenZibo/ashell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          inputs.hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          ./nixos/modules/common.nix
          ./nixos/hosts/${hostname}/configuration.nix
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.iris = {
              imports = [
                ./home-manager/home.nix
                ./home-manager/hosts/${hostname}.nix
              ];
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      desktop = mkHost "desktop";
      laptop = mkHost "laptop";
      school = mkHost "school";
    };
  };
}
