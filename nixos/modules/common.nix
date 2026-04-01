{...}: {
  imports = [
    ./boot.nix
    ./environment.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./time.nix
    ./users.nix
  ];

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
