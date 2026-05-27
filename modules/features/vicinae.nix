{ self, inputs, ... }:
{
  flake.nixosModules.vicinae =
    { pkgs, ... }:
    {
      imports = [ inputs.vicinae.nixosModules.default ];

      home-manager.users.iris = {
        imports = [ inputs.vicinae.homeManagerModules.default ];

        services.vicinae = {
          enable = true;
          package = inputs.vicinae.packages.${pkgs.stdenv.hostPlatform.system}.default;

          systemd = {
            enable = true;
            autoStart = true;
          };

          extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
            bluetooth
            nix
            player-pilot
            power-profile
            process-manager
            protondb-search
          ];
        };
      };
    };
}
