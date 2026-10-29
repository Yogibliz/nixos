{ config, inputs, ... }:
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    defaultSopsFile = ../../secrets/secrets.yaml;

    secrets = {
      wallhaven_api_key = { };
    };
  };
}
