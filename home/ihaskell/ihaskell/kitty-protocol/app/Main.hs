module Main where
import System.IO.CodePage
import OptParse (app)
import GHC.IO.Encoding (utf8)
_options = Options 
  { chatty = False 
  , nonWindowsBehavior = nonWindowsFallbackCodePageEncoding (\_ -> utf8)}

main :: IO ()
main = withCodePageOptions _options cp65001 app

    
