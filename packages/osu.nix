{
  fetchurl,
  appimageTools,
}:
let
  pname = "osu";
  version = "latest";

  src = fetchurl {
    url = "https://github.com/ppy/osu/releases/latest/download/osu.AppImage";
    hash = "sha256-TrvLW1gcA28WeFUAr1yNE60ebZMZb9Nr6PJFwqDqHS0=";
  };

  appimageContents = appimageTools.extract {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraPkgs =
    pkgs: with pkgs; [
      icu
    ];

  extraInstallCommands = ''
    install -m 444 -D ${appimageContents}/osu!.desktop $out/share/applications/${pname}.desktop
    substituteInPlace $out/share/applications/${pname}.desktop --replace-warn 'Exec=osu! %u' "Exec=${pname} %u"
    install -m 444 -D ${appimageContents}/osu.png $out/share/icons/hicolor/512x512/apps/osu.png
  '';

  meta = {
    description = "rhythm is just a *click* away!";
    homepage = "https://osu.ppy.sh/home";
    platforms = [ "x86_64-linux" ];
    mainProgram = "osu";
  };
}
