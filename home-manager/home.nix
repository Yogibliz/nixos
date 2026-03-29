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

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    # CLI utilities
    home-manager
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
    vesktop
    spotify
    protonvpn-gui
    pavucontrol
    zathura

    # System / UI
    adwaita-icon-theme
    networkmanagerapplet
    btop
  ];

  imports = [
    inputs.hyprshell.homeModules.hyprshell
    ./nvim/nvim.nix
    ./zsh/zsh.nix
    ./git/git.nix
    ./hyprland/hyprland.nix
    ./ghostty/ghostty.nix
    ./ashell/ashell.nix
  ];
}
