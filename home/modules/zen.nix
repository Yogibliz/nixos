{
  pkgs,
  inputs,
  config,
  ...
}:

{
  programs.firefox = {
    enable = true;
    package = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;

    # This tells Home Manager where Zen keeps its profiles
    # It also silences that evaluation warning
    configPath = ".config/zen";

    profiles = {
      "Default Profile" = {
        id = 0;
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        userChrome = ''
          /* Hide the Spaces/Workspaces button in the sidebar */
          #zen-workspaces-button {
            display: none !important;
          }
        '';
      };
    };
  };
}
