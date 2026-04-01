{pkgs, ...}: {
  nixpkgs.config.allowUnfree = true;

  # Packages stored alphabetiacally within categories
  home.packages = with pkgs; [
    # CLI utilities
    bat
    eza
    fd
    fzf
    ripgrep
    tree
    time

    # Development
    gcc
    rustc
    cargo
    statix
    python3

    # Desktop apps
    nautilus
    proton-vpn
    pavucontrol
    spotify
    vesktop
    yazi
    zathura

    # LaTeX
    texliveFull

    # Media
    ani-cli
    mpv

    # System / UI
    adwaita-icon-theme
    btop
    networkmanagerapplet
  ];
}
