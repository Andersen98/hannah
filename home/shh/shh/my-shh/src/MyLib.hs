{-# LANGUAGE OverloadedStrings #-}
module MyLib (someFunc) where
import System.Process.Typed



someFunc :: IO ()
someFunc = putStrLn "hello world"     


