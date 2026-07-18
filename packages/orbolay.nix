{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  fontconfig,
  freetype,
  libx11,
  libxtst,
  libxcb,
  libGL,
  libglvnd,
}:

stdenv.mkDerivation rec {
  pname = "orbolay";
  version = "3.6.0";

  src = fetchurl {
    url = "https://github.com/SpikeHD/Orbolay/releases/download/v${version}/orbolay-x86_64-unknown-linux-gnu";
    hash = "sha256-ZwAn9mie1qGzlH1afRmjRDT5PxNjbwGpAzVGq/1K19I=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    stdenv.cc.cc.lib
    libx11
    libxtst
    libxcb
    fontconfig
    freetype
    libGL
    libglvnd
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/orbolay
    runHook postInstall
  '';

  meta = {
    description = "Quick, small, native Discord overlay alternative";
    homepage = "https://github.com/SpikeHD/Orbolay";
    license = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "orbolay";
  };
}
