#!/usr/bin/env nix-shell
#!nix-shell --pure -i runghc -p "haskellPackages.ghcWithPackages (pkgs: [ pkgs.turtle ])"
import System.IO
import Data.Char (chr)
csi = [0x1b, 0x5b]
kittyBegin = csi ++ [ 0x3e, 0x31, 0x75]
kittyEnd = csi ++ [0x3c, 0x75]

echo = getChar >>= putChar

main = do
  -- emit escape code
  hSetBinaryMode stdout True
  hSetBuffering stdout NoBuffering
  hSetBuffering stdin NoBuffering
  hSetEcho stdin False
  hSetEcho stdout False
  mapM_ (hPutChar stdout . chr) kittyBegin

  -- echo 10 chars
  sequence_ (replicate 10 echo)
  

  -- emit ending escape code
  mapM_ (hPutChar stdout . chr) kittyEnd

  
