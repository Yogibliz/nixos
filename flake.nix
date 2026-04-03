{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ashell.url = "github:MalpenZibo/ashell";

    nixvim = {
      url = "github:nix-community/nixvim";
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
    hosts = ["desktop" "laptop" "school"];

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/modules
          ./nixos/hosts/${hostname}/configuration.nix
          ./nixos/hosts/${hostname}/hardware-configuration.nix

          # Home Manager integrated as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {inherit inputs;};
              users.iris = {
                imports = [
                  ./home-manager/home.nix
                  ./home-manager/hosts/${hostname}.nix
                ];
              };
            };
          }
        ];
      };
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hosts mkHost;
  };
}
