# ── Zsh ───────────────────────────────────────────────────
{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nv = "nvim";
      gl = "git log --stat";
      ll = "eza -la";
      la = "eza -a";
      cat = "bat";
      nrs = "sudo nixos-rebuild switch --flake ~/dotfiles#$(hostname)";
      nrb = "sudo nixos-rebuild boot --flake ~/dotfiles#$(hostname)";
      hms = "home-manager switch --flake ~/dotfiles#iris@$(hostname)";
      noct = "nix run nixpkgs#noctalia-shell ipc call state all > /home/iris/dotfiles/modules/features/noctalia/hosts/$(hostname)/noctalia.json";
      thesis = "nv /home/iris/Documents/IP23/bachelors/year3/tqpr10/BachelorsThesis/main.tex";
      pi = "ssh -p 2222 dietpi@192.168.1.100";
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "gitfast"
        "fzf"
      ];
    };
  };
}
