module OptParse (app) where
import Options.Applicative
import Control.Monad
import KittyProtocol (query,color)
import KittyProtocol.Transducer (transducer)

opts :: Parser (IO ())
opts = subparser
  ( command "query" (info (pure query) idm)
    <> command "color" (info (pure color) idm)
    <> command "transducer" (info (pure transducer) idm) )
    
app :: IO ()
app = join $ execParser (info opts idm)
