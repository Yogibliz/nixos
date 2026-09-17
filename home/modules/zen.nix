{ pkgs, inputs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
      DisablePocket = true;
      OfferToSaveLogins = false;
    };

    profiles.default = {
      presets = {
        betterfox.enable = true;
        catppuccin = {
          enable = true;
          flavor = "Mocha";
          accent = "Mauve";
        };
      };

      extensions = {
        packages = with firefox-addons; [
          seventv
          proton-pass
          return-youtube-dislikes
          ublock-origin
          vimium
        ];
      };

      extensionButtons = {
        "zen-sidebar-foot-buttons" = [
          "78272b6fa58f4a1abaac99321d503a20@proton.me"
          "uBlock0@raymondhill.net"
          "{d7742d87-e61d-4b78-b8a1-b469842139fa}"
        ];
      };

      mods = [
        "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
        "906c6915-5677-48ff-9bfc-096a02a72379" # Floating Status Bar
      ];

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "xpinstall.signatures.required" = false;
        "zen.theme.content-element-separation" = 0;
        "zen.view.compact.enable-at-startup" = true;
        "zen.welcome-screen.seen" = true;
      };

      userChrome = ''
        @import "catppuccin/userChrome.css";
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
}
