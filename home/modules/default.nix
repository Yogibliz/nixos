{ lib, ... }:

{
  # I hate Lamda style functions, they're unreadable...
  # To summarise this reads ./. for all files and directories
  # then filters the readDir results ex { "hyprland" = "directory"; "ghostty.nix" = "regular" }
  # accepting it as long as it's not named default.nix or artix-launcher
  # and it's either a directory or .nix file. This ensures no recursive importing of default.nix
  # and sub folders can handle their own imports through their own default.nix files.
  imports = lib.mapAttrsToList (file: _: ./. + "/${file}") (
    lib.filterAttrs (
      name: type:
      !(builtins.elem name [
        "default.nix"
        "artix-launcher"
      ])
      && (type == "directory" || lib.hasSuffix ".nix" name)
    ) (builtins.readDir ./.)
  );
}
