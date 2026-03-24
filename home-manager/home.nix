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
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fd
    bat
    eza
    fzf
    tree
    python3
    firefox
    yazi
    vesktop
    spotify
    protonvpn-gui
    adwaita-icon-theme
    networkmanagerapplet
    pavucontrol
    btop
    statix
    mpv
    ani-cli
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
