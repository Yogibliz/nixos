{...}: {
  programs.nixvim.clipboard = {
    register = "wl-copy";
    providers.wl-copy.enable = true;
  };
}
