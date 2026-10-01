{
  fetchurl,
  appimageTools,
}:
let
  pname = "root";
  version = "0.9.142";

  src = fetchurl {
    url = "https://installer.rootapp.com/installer/Linux/X64/Root.AppImage";
    hash = "sha256-vtUbpy4RDJR8xpfaTt4F3eCnKvkriZks+YzgNhGKbzY=";
  };

  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    # Install the .desktop entry
    install -m 444 -D ${appimageContents}/Root.desktop $out/share/applications/${pname}.desktop

    # Point Exec to the binary
    substituteInPlace $out/share/applications/${pname}.desktop --replace-warn 'Exec=Root' "Exec=${pname}"

    # Install the app icon
    install -m 444 -D ${appimageContents}/Root.png $out/share/icons/hicolor/512x512/apps/Root.png
  '';

  meta = {
    description = "Root chat and community platform";
    homepage = "https://www.rootapp.com";
    platforms = [ "x86_64-linux" ];
    mainProgram = "root";
  };
}
