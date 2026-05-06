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
        ];
      };
    };
}
