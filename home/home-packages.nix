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
    tree
    time
    cachix

    # Development
    # gcc
    gcc_multi
    rustc
    cargo
    gnumake
    statix
    python3
    texliveFull
    qemu_full

    # Desktop apps
    ghostty
    nautilus
    pavucontrol
    spotify
    vesktop
    vscode
    zathura
    zotero

    # Hyprland
    hyprshot
    hypridle

    # Media
    # ani-cli
    ani-skip
    mpv

    # System
    adwaita-icon-theme
    app2unit
    btop
    networkmanagerapplet
    wl-clipboard
    zsh-autopair
    zsh-syntax-highlighting
    zsh-completions

    # Flake pkgs
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
  };
}
