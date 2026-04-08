{ self, inputs, ... }:
{
  flake.nixosModules.time = {
    time.timeZone = "Europe/Stockholm";
  };
}
