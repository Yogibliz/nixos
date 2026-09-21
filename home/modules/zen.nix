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

      bookmarks = {
        force = true;
        settings = [
          {
            name = "Bookmarks Toolbar";
            toolbar = true;
            bookmarks = [
              {
                name = "YouTube";
                url = "https://www.youtube.com/";
              }
              {
                name = "Proton Mail";
                url = "https://mail.proton.me/u/1/inbox#category=primary";
              }
              {
                name = "School";
                bookmarks = [
                  {
                    name = "IP4";
                    url = "https://cloud.timeedit.net/liu/web/schema/ri1f1XYX50ZZ18Qv4Y0X4460y9Y5954667QQ198Q8Y73Y63145727.html";
                  }
                  {
                    name = "IP3";
                    url = "https://cloud.timeedit.net/liu/web/schema/ri1f7XYQ50ZZ6YQvQQ077820y6Y9957.html";
                  }
                  {
                    name = "PaperCut";
                    url = "https://portalliu.onricoh.se/";
                  }
                  {
                    name = "GitLab";
                    url = "https://gitlab.liu.se/";
                  }
                  {
                    name = "Ladok";
                    url = "https://student.ladok.se/student/app/studentwebb/";
                  }
                  {
                    name = "Lisam";
                    url = "https://liuonline.sharepoint.com/sites/Lisam/SitePages/en/Home.aspx?wa=wsignin1.0";
                  }
                ];
              }
              {
                name = "DPM.lol";
                url = "https://dpm.lol/Iris-phere";
              }
              {
                name = "Tenno Tools";
                url = "https://tenno.tools/pc";
              }
              {
                name = "Jellyfin";
                url = "http://localhost:8096/";
              }
              {
                name = "Cloudflare";
                url = "https://dash.cloudflare.com/8be0a8460d11d8e3a64104cdeffd5653/registrar/domains";
              }
              {
                name = "Pi-Hole";
                url = "http://192.168.1.100:8089/admin/";
              }
            ];
          }
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
