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
      awww
      bat
      cachix
      caelestia-cli
      calc
      eza
      fd
      fzf
      mesa-demos
      mmv
      ripgrep
      steam-run
      tree
      time

      # Desktop Environment
      noctalia

      # Desktop apps
      ghostty
      heroic
      nautilus
      proton-pass
      pwvucontrol
      sone
      vscode
      zathura
      zotero

      # Development
      gcc
      rustc
      cargo
      gnumake
      statix
      nix-index
      python313
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
      zsh-completions
      zsh-vi-mode
    ])
    ++ (builtins.attrValues self.packages.${pkgs.stdenv.hostPlatform.system});

}
