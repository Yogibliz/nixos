{ self, inputs, ... }:
{
  flake.nixosModules.comfyui =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.writeShellScriptBin "comfyui" ''
          exec ${inputs.comfyui-nix.packages.${pkgs.stdenv.hostPlatform.system}.rocm}/bin/comfyui \
            --use-pytorch-cross-attention \
            --gpu-only \
            "$@"
        '')
      ];
    };
}
