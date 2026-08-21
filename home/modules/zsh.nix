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
      err = "steam-run gamescope -w 3440 -h 1440 -W 3440 -H 1440 -f -r 175 -- '/mnt/games/SteamLibrary/steamapps/common/ELDEN\ RING/ERRv2.2.9.6/4\ -\ Launch\ ELDEN\ RING\ Reforged\ -\ Offline\ or\ Seamless\ \(Linux\).sh'";
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
