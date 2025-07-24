{ stdenv, lib, ... }:
let
  awesome = ./src;
in
stdenv.mkDerivation {
  pname = "sawm";

  version = "0.0.1";

  buildCommand = ''
    mkdir -p $out
    cp -r ${awesome}/* "$out/"
  '';

  meta = with lib; {
    description = "diego's awesomeWM config";
    homepage = "sudoneoox.github.io";
    platforms = platforms.all;
    licenses = license.glp3;
  };
}
