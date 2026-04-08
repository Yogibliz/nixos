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
          inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
          mesa
          wget
          wireplumber
          playerctl
          brightnessctl
          xdg-desktop-portal-hyprland
          xdg-desktop-portal-gtk
        ];
      };
    };
}
