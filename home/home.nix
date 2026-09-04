{ pkgs, ... }:
{
  imports = [
    ./modules
    ./home-packages.nix
  ];

  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesExtensions = prev.pythonPackagesExtensions ++ [
        (pyFinal: pyPrev: {
          pyqt5-sip = pyPrev.pyqt5-sip.overridePythonAttrs (old: {
            version = "12.13.0";
            src = pyFinal.fetchPypi {
              pname = "PyQt5_sip";
              version = "12.13.0";
              hash = "sha256-fzIdr4S5ydvKYbgOHvN72v/A6TMS7a4s19oluVOXHZE=";
            };
            env = (old.env or { }) // {
              NIX_CFLAGS_COMPILE =
                (old.env.NIX_CFLAGS_COMPILE or "")
                + " -Wno-error=incompatible-pointer-types -Wno-error=implicit-function-declaration -Wno-error=implicit-int";
            };
          });
        })
      ];
    })
  ];

  home = {
    username = "iris";
    homeDirectory = "/home/iris";
    stateVersion = "26.05";

    pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };

  programs.home-manager.enable = true;
}
