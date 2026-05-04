{
  nixConfig = {
    extra-substituters = [
      "https://vicinae.cachix.org"
      "https://noctalia.cachix.org"
    ];
    extra-trusted-public-keys = [
      "vicinae.cachix.org-1:1kDrfienkGHPYbkpNj1mWTr7Fm1+zcenzgTizIcI3oc="
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  inputs = {
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";

    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
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

      flake =
        let
          mkHost =
            hostname: system:
            inputs.nixpkgs.lib.nixosSystem {
              inherit system;

              specialArgs = { inherit inputs hostname self; };

              modules = [
                inputs.home-manager.nixosModules.home-manager
                {
                  home-manager.extraSpecialArgs = { inherit inputs hostname self; };
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                }
                ./hosts/${hostname}/configuration.nix
              ];
            };
        in
        {
          nixosConfigurations = {
            "laptop" = mkHost "laptop" "x86_64-linux";
            "desktop" = mkHost "desktop" "x86_64-linux";
            "school" = mkHost "school" "x86_64-linux";
          };
        };
    };
}
