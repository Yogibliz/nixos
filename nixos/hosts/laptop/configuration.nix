{pkgs, ...}: {
  networking.hostName = "laptop";

  # Might have to add kernel rebuild for audio fix...
  boot.kernelPatches = [
    {
      name = "samsung-galaxybook4-audio";
      patch = pkgs.fetchurl {
        url = "https://patch-diff.githubusercontent.com/raw/thesofproject/linux/pull/5616.patch";
        hash = "sha256-Ip6O4les1Hi2Rwrwi9aKhLkAmEJiAbmPXdFrAyHhCZo=";
      };
      extraConfig = ''
        SND_HDA_SCODEC_MAX98390 m
        SND_HDA_SCODEC_MAX98390_I2C m
        SND_SOC_MAX98390 m
      '';
    }
  ];
}
