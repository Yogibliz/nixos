{ pkgs, inputs, ... }:
{
  # Packages stored alphabetiacally within categories
  home.packages = with pkgs; [
    # CLI utilities
    appimage-run
    bat
    eza
    fastfetch
    fd
    fzf
    ripgrep
    mmv
    tree
    time
    cachix

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
    nautilus
    pavucontrol
    vesktop
    vscode
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
