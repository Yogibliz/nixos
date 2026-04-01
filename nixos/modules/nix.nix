{
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["iris"];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
  };
}
