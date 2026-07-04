{ pkgs, inputs, ... }:
{
  # Packages stored alphabetiacally within categories
  home.packages = with pkgs; [
    # CLI utilities
    appimage-run
    bat
    cachix
    calc
    eza
    fastfetch
    fd
    fzf
    mesa-demos
    mmv
    ripgrep
    tree
    time

    # Development
    gcc
    rustc
    cargo
    gnumake
    statix
    python3
    texliveFull
    quickshell

    # Desktop apps
    ghostty
    google-chrome
    nautilus
    pavucontrol
    proton-vpn
    proton-pass
    protonmail-desktop
    sone
    vesktop
    vscode
    qmk
    zathura
    zotero

    # Hyprland
    hyprshot
    hypridle

    # Media
    ani-cli
    ani-skip
    mpv

    # System
    adwaita-icon-theme
    btop
    networkmanagerapplet
    wl-clipboard
    zsh-autopair
    zsh-syntax-highlighting
    zsh-completions
  ];

}
