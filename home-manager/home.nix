{
  config,
  pkgs,
  pkgs-unstable,
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
    fzf
    eza
    vesktop
    pkgs-unstable.ashell
    alejandra # nix formatter
    tree
  ];

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    [main]
    font=monospace:size=13
    terminal=ghostty -e

    [colors]
    background=1e1e2edd
    text=cdd6f4ff
    match=89b4faff
    selection=313244ff
    selection-text=cdd6f4ff
    border=89b4faff

    [border]
    width=2
    radius=12
  '';

  # ── Imports ───────────────────────────────────────────────
  imports = [
    ./nvim/nvim.nix
    ./zsh/zsh.nix
    ./git/git.nix
    ./hyprland/hyprland.nix
    ./ghostty/ghostty.nix
  ];
}
