{
  inputs,
  pkgs,
  ...
}: {
  home = {
    username = "iris";
    homeDirectory = "/home/iris";
    stateVersion = "25.11";

    pointerCursor = {
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  home.packages = with pkgs; [
    # CLI utilities
    fd
    bat
    eza
    fzf
    tree
    time
    ripgrep

    # Development
    gcc
    rustc
    cargo
    statix
    python3

    # LaTeX
    texliveFull

    # Media
    mpv
    ani-cli

    # Desktop apps
    yazi
    nautilus
    vesktop
    element-desktop
    spotify
    proton-vpn
    pavucontrol
    zathura

    # System / UI
    adwaita-icon-theme
    networkmanagerapplet
    btop
  ];

  programs.home-manager.enable = true;

  imports = [
    ./nvim/nvim.nix
    ./zsh/zsh.nix
    ./git/git.nix
    ./hyprland/hyprland.nix
    ./ghostty/ghostty.nix
    ./ashell/ashell.nix
  ];
}
