# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
  ];

  # Configure allowed uris, since /etc/nixos/configuration.nix is a symlink.
  nix.settings.trusted-users = [ "root" "iris" ];
  nix.settings.allowed-uris = [
    "path:/home/iris/dotfiles"
  ];

  # Nix specific settings
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Filesystem
  fileSystems."/mnt/games" = {
    device = "/dev/disk/by-uuid/c82bd535-419a-4d80-92c1-22f3c4b88eb4";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  fileSystems."/mnt/media" = {
    device = "/dev/disk/by-uuid/4c4cf374-ebe1-4d9e-8c42-e1b0fdc5d764";
    fsType = "ext4";
    options = [
      "defaults"
      "nofail"
    ];
  };

  # Desktop Environment (COSMIC)
  # services.displayManager.cosmic-greeter.enable = true;
  # services.desktopManager.cosmic.enable = true;
  # environment.cosmic.excludePackages = with pkgs; [
  #   cosmic-edit
  #   cosmic-term
  #   cosmic-player
  #   cosmic-store
  # ];

  # Desktop Environment (Hyprland)
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

  # Recommended alongside Hyprland
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # ZSH
  programs.zsh.enable = true;
  users.users.iris.shell = pkgs.zsh;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable systemd-resolved
  services.resolved = {
    enable = true;
    dnssec = "false";
  };

  # Set your time zone.
  time.timeZone = "Europe/Stockholm";

  # Select internationalisation properties.
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.iris = {
    isNormalUser = true;
    description = "Iris";
    extraGroups = [
      "networkmanager"
      "wheel"
      "gamemode"
    ];
    packages = with pkgs; [ ];
  };

  # Handle font cache
  fonts.fontconfig.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Graphics Drivers
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Gamescope
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  # Steam
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    mesa
    firefox
    neovim
    wget
    ghostty
    yazi
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
