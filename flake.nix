{
  nixConfig = {
    extra-substituters = [
      "https://vicinae.cachix.org"
      "https://noctalia.cachix.org"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";

    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    millennium.url = "github:SteamClientHomebrew/Millennium/next?dir=packages/nix";
    nixvim.url = "github:nix-community/nixvim";

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    samsung-fixes = {
      url = "github:Andycodeman/samsung-galaxy-book-linux-fixes";
      flake = false;
    };
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ (inputs.import-tree ./modules) ];

      systems = [ "x86_64-linux" ];

      perSystem = { pkgs, ... }: {
        packages.orbolay = pkgs.callPackage ./packages/orbolay.nix { };
      };

      flake =
        let
          # 1. System Builder (No Home Manager)
          mkHost =
            hostname: system:
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;
              specialArgs = { inherit inputs hostname self; };
              modules = [
                ./hosts/${hostname}/configuration.nix
              ];
            };

          # 2. Standalone Home Manager Builder
          mkHome =
            hostname: system:
            inputs.home-manager.lib.homeManagerConfiguration {
              pkgs = import inputs.nixpkgs {
                inherit system;
                config.allowUnfree = true;
              };
              extraSpecialArgs = { inherit inputs hostname self; };
              modules = [
                ./home/home.nix
                ./home/hosts/${hostname}.nix

              ];
            };
        in
        {
          nixosConfigurations = {
            "laptop" = mkHost "laptop" "x86_64-linux";
            "desktop" = mkHost "desktop" "x86_64-linux";
            "school" = mkHost "school" "x86_64-linux";
          };

          homeConfigurations = {
            "iris@laptop" = mkHome "laptop" "x86_64-linux";
            "iris@desktop" = mkHome "desktop" "x86_64-linux";
            "iris@school" = mkHome "school" "x86_64-linux";
          };
        };
    };
}
