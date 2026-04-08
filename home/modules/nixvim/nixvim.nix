{ ... }:
{
  programs.nixvim = {
    enable = true;

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
    };
  };
}
