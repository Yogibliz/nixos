{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lazyvim.url = "github:pfassina/lazyvim-nix";

    hyprland.url = "github:hyprwm/Hyprland/v0.54.2?submodules=1";

    ashell = {
      url = "github:MalpenZibo/ashell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hy3 = {
      url = "github:outfoxxed/hy3?ref=hl0.54.2";
      inputs.hyprland.follows = "hyprland";
    };

    hyprshell = {
      url = "github:H3rmt/hyprshell?ref=hyprshell-release";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    lazyvim,
    hyprland,
    hy3,
    hyprshell,
    ashell,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
  in {
    homeConfigurations."iris" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit pkgs-unstable lazyvim hyprland hy3 hyprshell;
        ashell-pkg = ashell.packages.${system}.default;
        # .overrideAttrs (old: {
        #     postPatch = ''
        #       substituteInPlace src/outputs.rs \
        #         --replace "config::Layer::Bottom => Layer::Bottom" "config::Layer::Bottom => Layer::Overlay"
        #     '';
        #   });
      };
      modules = [./home.nix];
    };
  };
}
