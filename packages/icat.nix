{
  stdenv,
  fetchFromGitHub,
  imlib2,
  libx11,
}:

stdenv.mkDerivation rec {
  pname = "icat";
  version = "v0.5";

  src = fetchFromGitHub {
    owner = "atextor";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "0wyy2ksxp95vnh71ybj1bbmqd5ggp13x3mk37pzr99ljs9awy8ka";
  };

  buildInputs = [
    imlib2
    libx11
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp icat $out/bin
    runHook postInstall
  '';
}
