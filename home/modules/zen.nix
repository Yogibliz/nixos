{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.firefox = {
    enable = true;
    profiles.default = {
      # Enable custom CSS support
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      # Inject CSS to hide the Spaces/Workspaces button
      userChrome = ''
        #zen-workspaces-button {
          display: none !important;
        }
      '';
    };
  };
}
