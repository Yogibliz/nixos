{ pkgs, ... }:
{
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
    ghostty
    nautilus
    proton-vpn
    pavucontrol
    spotify
    vesktop
    yazi
    zathura
    zotero

    # LaTeX
    texliveFull

    # Media
    ani-cli
    mpv

    # System / UI
    adwaita-icon-theme
    btop
    hyprpaper
    hyprlock
    hypridle
    hyprshot
    hyprshell
    networkmanagerapplet
    wl-clipboard
  ];
}
