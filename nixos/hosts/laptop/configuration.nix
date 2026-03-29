{pkgs, ...}: {
  networking.hostName = "laptop";

  # Might have to add kernel rebuild for audio fix...
  boot.kernelPatches = [
    {
      name = "samsung-galaxybook4-audio";
      patch = ./samsung-audio.patch;
      extraConfig = ''
        SND_HDA_SCODEC_MAX98390 m
        SND_HDA_SCODEC_MAX98390_I2C m
        SND_SOC_MAX98390 m
      '';
    }
  ];

  boot.extraModprobeConfig = ''
    options snd-hda-intel model=alc298-samsung-max98390-4-amps
  '';
}
