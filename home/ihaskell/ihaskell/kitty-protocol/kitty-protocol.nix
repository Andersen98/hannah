{ mkDerivation, ansi-terminal, async, base, bytestring, lib
, optparse-applicative, typed-process
}:
mkDerivation {
  pname = "kitty-protocol";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    ansi-terminal async base bytestring typed-process
  ];
  executableHaskellDepends = [ base optparse-applicative ];
  testHaskellDepends = [ base ];
  license = lib.licenses.bsd3;
  mainProgram = "kitty-protocol";
}
