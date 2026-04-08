{ self, inputs, ... }:
{
  flake.nixosModules.desktopHardware =
    {
      config,
      lib,
      pkgs,
      modulesPath,
      ...
    }:
    {
      imports = [
        (modulesPath + "/installer/scan/not-detected.nix")
      ];

      boot.initrd.availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ "kvm-amd" ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/3d53210d-9822-4183-8753-51a7d1ecd526";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/D045-9964";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      fileSystems."/mnt/media" = {
        device = "/dev/disk/by-uuid/4c4cf374-ebe1-4d9e-8c42-e1b0fdc5d764";
        fsType = "ext4";
      };

      fileSystems."/mnt/games" = {
        device = "/dev/disk/by-uuid/c82bd535-419a-4d80-92c1-22f3c4b88eb4";
        fsType = "ext4";
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };

}
