{ pkgs ? import <nixpkgs> {} }:

pkgs.haskell.packages.ghc9101.shellFor {
  withHoogle = true;
  
  packages = hpkgs: [
    
    (hpkgs.callPackage ./hs-reedline/hs-reedline.nix {})
    (hpkgs.callPackage ./my-shh/my-shh.nix {})
    ];
    nativeBuildInputs = [
          pkgs.cabal-install
    pkgs.haskellPackages.doctest
    pkgs.cabal2nix
    pkgs.ghcid
    ];
    }
