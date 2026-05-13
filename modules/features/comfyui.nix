{ self, inputs, ... }:
{
  flake.nixosModules.comfyui =
    { pkgs, ... }:
    {
      environment.systemPackages = [
        (pkgs.writeShellScriptBin "comfyui" ''
          exec nix run github:utensils/comfyui-nix#rocm -- \
            --use-pytorch-cross-attention \
            --gpu-only \
            "$@"
        '')
      ];
    };
}
