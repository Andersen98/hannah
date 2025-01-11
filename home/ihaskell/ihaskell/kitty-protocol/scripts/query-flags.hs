#! /usr/bin/env nix-shell
#! nix-shell -p "haskellPackages.ghcWithPackages (pkgs: [ pkgs.PyF])"
#! nix-shell -i runghc
{-# LANGUAGE QuasiQuotes #-}
import System.IO
import Text.ParserCombinators.ReadP
import PyF
import System.Exit
import Data.Char (ord,chr,isNumber)




_p = between (string "\ESC[?") (string "u") (munch1 isNumber)
_s =   readP_to_S _p

__r acc = hWaitForInput stdin 50 >>= (\x -> if x then (getChar >>= (\k -> __r $ k:acc)) else pure acc)
_r :: IO [Char]
_r = pure . reverse =<<  __r []
_queryKittyFlag = putStr ('\ESC':'[':'?':'u':[])
_pushKittyFlag flag =  putStr ('\ESC':'[':'>':flag:'u':[])
_popKittyFlag  =  putStr ('\ESC':'[':'<':'1':'u':[])

-- main = _pushKittyFlag '1'  >> hSetBuffering stdout NoBuffering >> _queryKittyFlag >> getChar >> getChar >> getChar >> getChar >>= putChar >> putStrLn "done" >> exitSuccess
main = hSetBinaryMode stdin True >> _pushKittyFlag '1'  >> _queryKittyFlag >>  hWaitForInput stdin 5000 >> _r >>= print >>  _popKittyFlag  >> exitSuccess
