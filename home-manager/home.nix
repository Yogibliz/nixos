{
  config,
  pkgs,
  pkgs-unstable,
  hyprshell,
  ...
}: {
  home.username = "iris";
  home.homeDirectory = "/home/iris";
  home.stateVersion = "25.11";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # ── Packages ──────────────────────────────────────────────
  home.packages = with pkgs; [
    fd
    bat
    eza
    vesktop
    fzf
    pkgs-unstable.ashell
    tree
    python3
    adwaita-icon-theme
    #spotify
  ];

  # ── Imports ───────────────────────────────────────────────
  imports = [
    hyprshell.homeModules.hyprshell
    ./nvim/nvim.nix
    ./zsh/zsh.nix
    ./git/git.nix
    ./hyprland/hyprland.nix
    ./ghostty/ghostty.nix
  ];
}
