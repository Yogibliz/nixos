{ self, inputs, ... }:
{
  flake.nixosModules.samsungAudio =
    { ... }:
    {
      imports = [ "${inputs.samsung-fixes}/nixos/samsung-speaker-fix.nix" ];
    };
}
