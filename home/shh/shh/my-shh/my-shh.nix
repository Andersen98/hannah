{ mkDerivation, async, base, bytestring, lib, typed-process }:
mkDerivation {
  pname = "my-shh";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [ async base bytestring typed-process ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [ base ];
  license = lib.licenses.bsd3;
  mainProgram = "my-shh";
}
