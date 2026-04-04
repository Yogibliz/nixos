{ ... }:
{
  programs.nixvim.colorschemes = {
    rose-pine = {
      enable = true;
      settings = {
        dark_variant = "moon";
        dim_inactive_windows = true;
        extend_background_behind_borders = true;
        styles = {
          bold = true;
          italics = true;
          transparency = true;
        };
        variant = "auto";
      };
    };
  };
}
