# ── Zsh ───────────────────────────────────────────────────
{ pkgs, ... }:

{
  programs.zsh = {
    enable    = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
   
    shellAliases = {
      nv  = "nvim";
      ll  = "eza -la";
      la  = "eza -a";
      cat = "bat";
      hms = "home-manager switch";
      dotfiles  = "git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME";
      nix-backup = "git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME add ~/.config/nixos ~/.config/home-manager && git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME commit -m 'latest update' && git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME push";
      nix-pull  = "git --git-dir=$HOME/.dotfiles/.git/ --work-tree=$HOME checkout main -- .config/nixos .config/home-manager";
    };

    oh-my-zsh = {
      enable  = true;
      theme   = "robbyrussell";
      plugins = [ "git" "fzf" ];
    };
   
    loginExtra = ''
      if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland
      fi
    '';
  };
}
