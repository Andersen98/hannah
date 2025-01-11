module Main (main) where
import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import System.Console.Utils.Kitty.Parser
import KittyProtocol.Transducer

main :: IO ()
main = hspec $ do
  describe "KittyProtocol.Transducer.turn" $ do
    it ""
