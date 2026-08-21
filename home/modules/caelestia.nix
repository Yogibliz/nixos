{
  inputs,
  ...
}:
{
  imports = [
    inputs.caelestia-shell.homeModules.default
  ];

  programs.caelestia = {
    enable = true;
    settings = {

    };
    cli = {
      enable = true;
      settings = {

      };
    };
  };
}
