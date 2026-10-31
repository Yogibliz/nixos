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
      err = "steam-run '/mnt/games/SteamLibrary/steamapps/common/ELDEN\ RING/ERRv2.3.7.1/4\ -\ Launch\ ELDEN\ RING\ Reforged\ -\ Offline\ or\ Seamless\ \(Linux\).sh'";
      pi = "ssh -p 2222 dietpi@192.168.1.100";
      wake = "ssh pihole wakeonlan 9c:6b:00:4a:33:bf";
      gpp20 = "g++ -std=c++20 -Wall -O2 -Wextra -pedantic -Weffc++ -Wsuggest-attribute=const";
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
