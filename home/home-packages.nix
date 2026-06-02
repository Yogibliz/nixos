{ pkgs, inputs, ... }:
{
  # Packages stored alphabetiacally within categories
  home.packages = with pkgs; [
    # CLI utilities
    appimage-run
    bat
    cachix
    eza
    fastfetch
    fd
    fzf
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
    protonmail-desktop
    proton-pass
    proton-vpn
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
    jellyfin
    jellyfin-ffmpeg
    jellyfin-web
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
