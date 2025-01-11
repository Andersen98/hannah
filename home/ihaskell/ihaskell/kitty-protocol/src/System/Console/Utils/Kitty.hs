module System.Console.Utils.Kitty
  (
   pushFlag
  , popFlag
  , KittyEvent (..)
  , EventType (..)
  ) where
import System.Console.ANSI.Codes (csi)
import System.Console.Utils.Kitty.Parser


data ProgressiveEnhancementFlag
  = DisambiguateEscapeCodes
  | ReportEventTypes
  | ReportAlternateKeys
  | ReportAllKeysAsEscapeCodes
  | ReportAssociatedText

pushFlag :: ProgressiveEnhancementFlag -> String
pushFlag flag = let
  bit =  case flag of
    DisambiguateEscapeCodes -> "1"
    ReportEventTypes -> "2"
    ReportAlternateKeys -> "4"
    ReportAllKeysAsEscapeCodes -> "8"
    ReportAssociatedText -> "16"
  str = ">" ++ bit ++ "u"
  in csi [] str

popFlag :: (Maybe Int) -> String
popFlag x = case x of
  Just n -> csi [] $ ">" ++ (show n) ++ "u"
  Nothing -> csi [] ">u"
    
