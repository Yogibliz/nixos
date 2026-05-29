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
    ydotool

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
