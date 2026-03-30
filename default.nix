{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "volantes-hyprcursor";
  version = "0.1";
  src = fetchFromGitHub {
    owner = "bndlfm";
    repo = "volantes-hyprcursor";
    rev = "504e3325e2e858b58b435731ec68a500776f06f0";
    sha256 = "sha256-yupOlKvDlJ8zuiPmDpwB9Wyf/hYUHIRNidU6B3QQZn8=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/icons/volantes-light-hyprcursor
    cp -R $src/light/. $out/share/icons/volantes-light-hyprcursor/

    mkdir -p $out/share/icons/volantes-dark-hyprcursor
    cp -R $src/dark/. $out/share/icons/volantes-dark-hyprcursor/

    runHook postInstall
  '';

  meta = with lib; {
    description = "volantes cursors in hyprcursor format";
    downloadPage = "https://github.com/bndlfm/volantes-hyprcursor";
    homepage = "https://www.deviantart.com/aystic/gallery";
    license = licenses.gpl2Only;
    maintainers = with maintainers; [ bndlfm ];
  };
})
