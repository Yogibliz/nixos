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
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    hosts = ["desktop" "laptop" "school"];

    mkHost = hostname:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          home-manager.nixosModules.home-manager
          ./nixos/modules/common.nix
          ./nixos/hosts/${hostname}/configuration.nix
          ./nixos/hosts/${hostname}/hardware-configuration.nix
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

    mkHome = hostname:
      home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          {nixpkgs.config.allowUnfree = true;}
          ./home-manager/home.nix
          ./home-manager/hosts/${hostname}.nix
        ];
      };
  in {
    nixosConfigurations = nixpkgs.lib.genAttrs hosts mkHost;
    homeConfigurations = nixpkgs.lib.genAttrs hosts mkHome;
  };
}
