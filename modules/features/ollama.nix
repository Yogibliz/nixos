{ self, inputs, ... }:
{
  flake.nixosModules.ollama =
    { pkgs, ... }:
    {
      nixpkgs.config.rocmSupport = true;

      services = {
        ollama = {
          enable = true;
          package = pkgs.ollama-rocm;
          # models = "/var/lib/ollama";
          # "qwen3.5:9b";
          # "qwen3-coder:30b";

          environmentVariables = {
            OLLAMA_GPU_DRIVER = "rocm";
            HSA_OVERRIDE_GFX_VERSION = "11.0.0"; # RDNA3 fix
          };
        };

        open-webui = {
          enable = true;
          host = "0.0.0.0";
          port = 3000;
          environment = {
            OLLAMA_BASE_URLS = "http://localhost:11434";
            WEBUI_NAME = "Qwen Chat";
            ENABLE_RAG = "True";
            RAG_TOP_K = "5";
          };
        };
      };

      users.users.iris.extraGroups = [ "ollama" ];
    };
}
