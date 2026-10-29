{ pkgs, inputs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.firefox = {
    enable = true;

    languagePacks = [ "en-US" ];

    policies = {
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableProfileImport = true;
      DisableProfileRefresh = true;
      DisablePocket = true;
      DisableSetDesktopBackground = true;
      DisableTelemetry = true;
      DisplayMenuBar = "never";
      DontCheckDefaultBrowser = true;
      HardwareAcceleration = true;
      OfferToSaveLogins = false;
    };

    profiles.default = {
      isDefault = true;
      extensions = {
        packages = with firefox-addons; [
          seventv
          proton-pass
          return-youtube-dislikes
          ublock-origin
          vimium
        ];
      };

      settings = {
        "browser.startup.page" = 3;
        "sidebar.verticalTabs" = true;
        "sidebar.visibility" = "expand-on-hover";
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

      search = {
        force = true;
        default = "Google";
        engines = {
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@np" ];
          };

          "NixOS Options" = {
            urls = [
              {
                template = "https://search.nixos.org/options";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = [ "@no" ];
          };
        };
      };
    };
  };

}
