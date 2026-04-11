{ lib, ... }:
let
  pluginFiles = lib.filesystem.listFilesRecursive ./plugins;
in
{
  imports = pluginFiles;

  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      linebreak = true;
    };
  };
}
