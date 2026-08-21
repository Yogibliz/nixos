{
  pkgs,
  inputs,
  self,
  ...
}:
{
  # Packages stored alphabetiacally within categories
  home.packages =
    (with pkgs; [
      # CLI utilities
      appimage-run
      bat
      cachix
      calc
      eza
      fastfetch
      fd
      fzf
      mesa-demos
      mmv
      ripgrep
      steam-run
      tree
      time

      # Development
      gcc
      rustc
      cargo
      gnumake
      statix
      nix-index
      python3
      texliveFull
      quickshell

      # LSPs
      nixd
      qt6.qtdeclarative
      clang-tools
      lua-language-server
      rust-analyzer
      pyright
      ruby-lsp
      vscode-langservers-extracted
      typescript-language-server

      # Desktop apps
      ghostty
      google-chrome
      heroic
      nautilus
      pavucontrol
      sone
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
      mpvpaper

      # System
      adwaita-icon-theme
      btop
      networkmanagerapplet
      wl-clipboard
      zsh-autopair
      zsh-syntax-highlighting
      zsh-completions
    ])
    ++ (builtins.attrValues self.packages.${pkgs.stdenv.hostPlatform.system});

}
