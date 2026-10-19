{
  nixConfig = {
    extra-substituters = [
      "https://vicinae.cachix.org"
      "https://noctalia.cachix.org"
      "https://nix-community.cachix.org"
      "https://umbriel.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    nixvim.url = "github:nix-community/nixvim";
    vicinae.url = "github:vicinaehq/vicinae";
    umbriel.url = "github:noctalia-dev/umbriel";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    millennium = {
      url = "github:SteamClientHomebrew/Millennium/next?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
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
        packages.icat = pkgs.callPackage ./packages/icat.nix { };
        packages.root = pkgs.callPackage ./packages/root.nix { };
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
                config = {
                  allowUnfree = true;
                  permittedInsecurePackages = [ ];
                };
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
