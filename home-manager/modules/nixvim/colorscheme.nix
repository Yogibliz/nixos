{ ... }:
{
  programs.nixvim.colorschemes = {
    rose-pine = {
      enable = true;
      settings = {
        dark_variant = "moon";
        extend_background_behind_borders = true;
        styles = {
          bold = true;
          italics = true;
          transparency = true;
        };
        variant = "auto";
        highlight_groups = {
          # Splits
          WinSeparator = {
            fg = "overlay";
            bg = "none";
          };

          # Which-key
          WhichKeyNormal = {
            bg = "none";
          };
          WhichKeyBorder = {
            fg = "overlay";
            bg = "none";
          };

          # Floating windows
          NormalFloat = {
            bg = "none";
          };
          FloatBorder = {
            fg = "overlay";
            bg = "none";
          };
          FloatTitle = {
            fg = "foam";
            bg = "none";
          };
        };
      };
    };
  };
}
