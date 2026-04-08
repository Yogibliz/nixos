# ── Zsh ───────────────────────────────────────────────────
{ ... }:
{
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
      nrb = "sudo nixos-rebuild boot --flake ~/dotfiles#$(hostname)";
      noct = "nix run nixpkgs#noctalia-shell ipc call state all > ./modules/features/noctalia.json";
      time = "command time -f '======= Time & Memory =======\n\t%e seconds, \n\t%S systime (kernel), \n\t%P CPU, \n\t%M KB memory (MAX)'";
      pi = "ssh -p 2222 dietpi@192.168.1.100";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "fzf"
      ];
    };
  };
}
