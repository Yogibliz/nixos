{ self, inputs, ... }:
{
  flake.nixosModules.environment =
    {
      pkgs,
      inputs,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      environment = {

        variables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };

        sessionVariables = {
          AMD_VULKAN_ICD = "RADV";
          ENABLE_LAYER_MESA_ANTI_LAG = "1";
          RADV_PERFTEST = "sam, nircache, ngcc";
          PROTON_ENABLE_WAYLAND = "1";
        };

        systemPackages = with pkgs; [
          git
          mesa
          wget
          wireplumber
          playerctl
          brightnessctl
          wayland-pipewire-idle-inhibit
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
          vulkan-tools
        ];
      };
    };
}
