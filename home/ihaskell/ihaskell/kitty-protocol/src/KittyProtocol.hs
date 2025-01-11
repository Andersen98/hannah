{-# LANGUAGE OverloadedStrings #-}
module KittyProtocol (color, query, transducer) where
import System.IO
import Data.Char
import Control.Monad

type KittyCommand = String

csi = "\x1b\x5b\&"
osc = "\x1b\x5d\&"
st = "\x1b\x5c\&"

_pushColors = osc ++ "30001" ++ st
_popColors = osc ++ "30101" ++ st

_reverseVideo = csi ++ "7m"
_getStrUntilInclusive x end = getChar >>= (\y -> if (y==end) then pure (reverse $ y:x) else _getStrUntilInclusive (y:x) end )

_colorCtl bindings = osc ++ "21;" ++ (foldMap (\(k,v) -> k ++  v ++ ";") bindings) ++ st
_queryWindow = putStr (csi ++ "14t") >> _getStrUntilInclusive "" 't'
color :: IO ()
color = do
  putStrLn $ csi ++ "2*x" ++ csi ++ "4;3;11;10;44$r" ++ csi ++ "*x"
  putStrLn $ csi ++ "4:3m"
  putStrLn "wavy"
  putStrLn $ csi ++ "4:0m"
  
  

query :: IO ()
query = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  -- forever $ getChar >>= print
  putStrLn "\x1b\x5b\&>8u"
  sequence_ $ replicate 20 (getChar >>= pure . showLitChar >>= (\s -> putStrLn (s "-- LitChar")))
  putStrLn "\x1b\x5b\&<1u"

transducer :: IO ()
transducer = putStrLn "Todo"
