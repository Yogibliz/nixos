{
  pkgs,
  inputs,
  ...
}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["iris"];
  };

  programs.zsh.enable = true;

  users.users.iris = {
    isNormalUser = true;
    description = "Iris";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "gamemode" "video"];
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;
  networking.firewall.checkReversePath = "loose";

  services.resolved = {
    enable = true;
    dnssec = "false";
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "sv_SE.UTF-8";
    LC_IDENTIFICATION = "sv_SE.UTF-8";
    LC_MEASUREMENT = "sv_SE.UTF-8";
    LC_MONETARY = "sv_SE.UTF-8";
    LC_NAME = "sv_SE.UTF-8";
    LC_NUMERIC = "sv_SE.UTF-8";
    LC_PAPER = "sv_SE.UTF-8";
    LC_TELEPHONE = "sv_SE.UTF-8";
    LC_TIME = "sv_SE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    xwayland.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    mesa
    wget
  ];

  system.stateVersion = "25.11";
}
