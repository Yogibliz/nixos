{
  system = {
    # Make sure spotify cache is cleared to resolve the opening issue
    activationScripts.clearSpotifyCache.text = ''
      rm -rf /home/iris/.cache/spotify || true
    '';

    # No touchy!
    stateVersion = "25.11"; # Bad girl, no touching!!!
  };
}
