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
          inputs.hyprland.nixosModules.default
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
