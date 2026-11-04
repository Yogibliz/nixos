{ self, inputs, ... }:
{
  flake.nixosModules.sharedHardware =
    { pkgs, ... }:
    {
      hardware = {
        bluetooth.enable = true;
        i2c.enable = true;
        keyboard.qmk.enable = true;
        opentabletdriver.enable = true;
        uinput.enable = true;
      };
    };
}
