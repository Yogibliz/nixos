{ pkgs, inputs, ... }:
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
    cachix

    # Development
    gcc
    rustc
    cargo
    statix
    python3
    texliveFull

    # Desktop apps
    ghostty
    nautilus
    pavucontrol
    spotify
    vesktop
    zathura
    zotero

    # Media
    # ani-cli
    mpv

    # System / UI
    adwaita-icon-theme
    app2unit
    btop
    hyprshot
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
