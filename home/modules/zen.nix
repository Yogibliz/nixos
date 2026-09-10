{ pkgs, inputs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;

  # 1. Grab the unwrapped package from the flake and apply the passthru fix
  zen-unwrapped-fixed =
    inputs.zen-browser.packages.${system}.zen-browser-unwrapped.overrideAttrs
      (old: {
        passthru = (old.passthru or { }) // {
          withFFmpeg = true;
        };
      });

  # 2. Override the default wrapped package to use our fixed unwrapped version
  zen-fixed = inputs.zen-browser.packages.${system}.default.override {
    zen-browser-unwrapped = zen-unwrapped-fixed;
  };
in
{
  programs.firefox = {
    enable = true;
    package = zen-fixed; # package = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default;
    configPath = ".config/zen";

    profiles = {
      "Default Profile" = {
        id = 0;
        isDefault = true;

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "zen.theme.content-element-separation" = 0;
          "xpinstall.signatures.required" = false;
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
