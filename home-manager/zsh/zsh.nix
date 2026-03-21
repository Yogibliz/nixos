# ── Zsh ───────────────────────────────────────────────────
{...}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nv = "nvim";
      ll = "eza -la";
      la = "eza -a";
      cat = "bat";
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#$(hostname)";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git" "fzf"];
    };
  };
}
