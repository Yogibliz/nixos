{
  pkgs,
  inputs,
  ...
}: {
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-users = ["iris"];
  };

  # Global programs
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
      xwayland.enable = true;
    };
  };

  # User settings
  users.users.iris = {
    isNormalUser = true;
    description = "Iris";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "gamemode" "video"];
  };

  # Boot settings
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # Auto garbage collect weekly, keeping only recent generations
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # Networking settings
  networking = {
    networkmanager.enable = true;
    firewall.checkReversePath = "loose";
  };

  # Services
  services = {
    # DNS resolver
    resolved = {
      enable = true;
      dnssec = "false";
    };

    # Bluetooth service
    blueman.enable = true;

    # Power profiles
    upower.enable = true;
    power-profiles-daemon.enable = true;

    # XServer
    xserver.xkb = {
      layout = "us";
      variant = "";
    };

    # Pipewire Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # Display Manager
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  # Hardware
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  time.timeZone = "Europe/Stockholm";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };

  security.rtkit.enable = true;

  # Allow Unfree packages
  nixpkgs.config.allowUnfree = true;

  # Make sure spotify cache is cleared to resolve the opening issue
  system.activationScripts.clearSpotifyCache.text = ''
    rm -rf /home/iris/.cache/spotify || true
  '';

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    mesa
    wget
    wireplumber
    playerctl
    brightnessctl
  ];

  # No touchy!
  system.stateVersion = "25.11"; # Bad girl, no touching!!!
}
