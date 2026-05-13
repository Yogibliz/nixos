{ inputs, ... }:
{
  flake.nixosModules.comfyui =
    { pkgs, ... }:
    {
      nixpkgs.overlays = [ inputs.comfyui-nix.overlays.default ];

      environment.systemPackages = [
        (pkgs.writeShellScriptBin "comfyui" ''
          exec ${pkgs.comfy-ui-rocm}/bin/comfyui \
            --use-pytorch-cross-attention \
            --gpu-only \
            "$@"
        '')
      ];
    };
}
