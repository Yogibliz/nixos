{ pkgs, inputs, ... }:

{
  programs.firefox = {
    enable = true;
    package = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    configPath = ".config/zen";

    profiles = {
      "Default Profile" = {
        id = 0;
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "zen.theme.content-element-separation" = 0;
        };

        userChrome = ''
          /* Hide the "Space" text/indicator and workspace buttons */
          #zen-workspaces-button,
          #zen-current-workspace-indicator,
          [id*="workspace-indicator"],
          [class*="workspace-indicator"] {
            display: none !important;
          }
        '';
      };
    };
  };
}
