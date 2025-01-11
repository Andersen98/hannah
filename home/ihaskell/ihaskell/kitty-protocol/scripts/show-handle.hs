#! /usr/bin/env nix-shell
#! nix-shell -p "haskellPackages.ghcWithPackages (pkgs: [ pkgs.PyF])"
#! nix-shell -i runghc
{-# LANGUAGE QuasiQuotes #-}
import System.IO
import PyF

pPrintHandle name handle = do
  info <- hShow handle
  putStrLn [fmt|{name:< 11}: {info}|]


main = do
  pPrintHandle "stdin" stdin
  pPrintHandle "stdout" stdout
