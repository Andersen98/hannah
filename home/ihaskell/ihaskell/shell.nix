{ pkgs ? import <nixpkgs> {} }:

pkgs.haskell.packages.ghc9101.shellFor {
  withHoogle = true;
  
  packages = hpkgs: [
    
    (hpkgs.callPackage ./kitty-protocol/kitty-protocol.nix {})
    ];
    nativeBuildInputs = [
    pkgs.happy
          pkgs.cabal-install
    pkgs.cabal2nix
    pkgs.ghcid
    ];
    }
