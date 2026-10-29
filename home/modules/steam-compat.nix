{ pkgs, ... }:
{
  home.file.".local/share/Steam/compatibilitytools.d/GE-Proton".source =
    pkgs.proton-ge-bin.steamcompattool;
}
