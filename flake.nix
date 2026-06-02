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
    vicinae.url = "github:vicinaehq/vicinae";
    vicinae-extensions.url = "github:vicinaehq/extensions";

    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, ... }:
    let
      mkHome =
        hostname:
        inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs self hostname; };
          modules = (map (n: inputs.${n}.homeManagerModules.default) (import ./hm-modules.nix)) ++ [
            { nixpkgs.config.allowUnfree = true; }
            ./home/home.nix
            ./home/hosts/${hostname}.nix
          ];
        };
    in
    {
      homeConfigurations = {
        laptop = mkHome "laptop";
        desktop = mkHome "desktop";
        school = mkHome "school";
      };
    };
}
