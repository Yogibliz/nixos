# ── Zsh ───────────────────────────────────────────────────
{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nv = "nvim";
      ll = "eza -la";
      la = "eza -a";
      cat = "bat";
      hms = "home-manager switch";
      nixos-rebuild-switch = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git" "fzf"];
    };

    loginExtra = ''
      if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
  };
}
