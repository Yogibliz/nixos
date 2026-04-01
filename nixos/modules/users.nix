{pkgs, ...}: {
  programs.zsh.enable = true;

  users.users.iris = {
    isNormalUser = true;
    description = "Iris";
    shell = pkgs.zsh;
    extraGroups = ["networkmanager" "wheel" "gamemode" "video"];
  };
}
