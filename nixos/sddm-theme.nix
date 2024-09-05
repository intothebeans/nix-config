{
  stdenv,
  lib,
}: let
  fs = lib.fileset;
  source = ./eucalyptus-drop;
in {
  eucalyptus-drop = stdenv.mkDerivation rec {
    pname = "gently-color-sddm";
    version = "1.0";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src/eucalyptus-drop $out/share/sddm/themes/
    '';
    src = fs.toSource {
      root = ./.;
      fileset = source;
    };
  };
}
