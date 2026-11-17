{ inputs, ... }:
{
  imports = [ inputs.luciole.homeModules.default ];

  programs.luciole = {
    enable = false;
    settings = {

    };
  };
}
