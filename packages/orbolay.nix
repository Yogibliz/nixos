{
  lib,
  stdenv,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  fontconfig,
  freetype,
  libGL,
  libglvnd,
  libxcursor,
  libxi,
  libxrandr,
  libxinerama,
  libx11,
  libxtst,
  libxcb,
  wayland,
  libxkbcommon,
}:

stdenv.mkDerivation rec {
  pname = "orbolay";
  version = "3.6.0";

  src = fetchurl {
    url = "https://github.com/SpikeHD/Orbolay/releases/download/v${version}/orbolay-x86_64-unknown-linux-gnu";
    hash = "sha256-ZwAn9mie1qGzlH1afRmjRDT5PxNjbwGpAzVGq/1K19I=";
  };

  dontUnpack = true;

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
  ];

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

  runtimeLibs = [
    libxcursor
    libxi
    libxrandr
    libxinerama
    wayland
    libxkbcommon
  ];

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/orbolay
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/orbolay \
      --prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath runtimeLibs}
  '';

  meta = {
    description = "Quick, small, native Discord overlay alternative";
    homepage = "https://github.com/SpikeHD/Orbolay";
    license = lib.licenses.gpl3Only;
    platforms = [ "x86_64-linux" ];
    mainProgram = "orbolay";
  };
}
