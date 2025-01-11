{
module System.Console.Utils.Kitty.Parser
 (
    keyboard
  , KittyEvent (..)
  , getCSI
  , lexer
 ) where
import Data.Char
import System.IO
}
%name keyboard
%tokentype { Token }
%error { parseError }
%token
      CSI             { TokenCSI }
      int            { TokenInt $$}
      ';'             { TokenSemiColon }
      ':'             { TokenColon }
      'u'             { TokenU }
%%
KittyEvent : CSI Params 'u'                                    { $2 defaultKittyEvent }

Params     : KeyCodes ';' Mods ';' CodePoints ';'              { \p -> ($1 . $3 . $5) p}
Params     : KeyCodes ';' Mods ';' CodePoints                  { \p ->  ($1 . $3 . $5) p }
           | KeyCodes ';' ';' CodePoints ';'                   { \p ->  ($1 . $4 ) p}
           | KeyCodes ';' ';' CodePoints                       { \p ->  ($1 . $4) p}
           | KeyCodes ';' Mods ';' ';'                         { \p ->  ($1 . $3) p}
           | KeyCodes ';' Mods ';'                             { \p ->  ($1 . $3) p}
           | KeyCodes ';' Mods                                 { \p ->  ($1 . $3) p }
           | KeyCodes ';' ';' ';'                              { \p ->  $1 p }
           | KeyCodes ';' ';'                                  { \p ->  $1 p }
           | KeyCodes ';'                                      { \p ->  $1 p }
           | KeyCodes                                          { \p ->  $1 p }

KeyCodes   : int                       { \p -> p { _unicodeKeyCode = $1 } }
           | int ':' int              { \p -> p { _unicodeKeyCode = $1, _shiftedKey = Just $3 } }
           | int ':' int ':' int     { \p -> p { _unicodeKeyCode = $1, _shiftedKey = Just $3, _baseLayoutKey = Just $5} }
           | int ':' ':' int          { \p -> p { _unicodeKeyCode = $1, _baseLayoutKey = Just $4} }

Mods       : int                       { \p -> p { _modifierKey = $1} }
           | int ':' int              { \p -> p { _modifierKey = $1, _eventType = $3} }
           | ':' int                   { \p -> p { _eventType = $2} }

CodePoints : CodePoints1                        { \p -> p { _textAsCodePoints = $1} }
CodePoints1:  int                        { [$1] }
           | CodePoints1 ':' int         { $3 : $1 }

{
parseError :: [Token] -> a
parseError _ = error "Parse error"
data KittyEvent
  = KittyEvent
  { _unicodeKeyCode :: Int
  , _shiftedKey :: Maybe Int
  , _baseLayoutKey :: Maybe Int
  , _modifierKey :: Int
  , _eventType :: Int
  , _textAsCodePoints :: [Int]
  } deriving(Eq, Show)
defaultKittyEvent = KittyEvent 96 Nothing Nothing 1 1 []
data EventType
  = Press
  | Repeat
  | Release
  deriving (Eq,Show, Enum)
data Token
  = TokenCSI
  | TokenInt Int
  | TokenColon
  | TokenSemiColon
  | TokenU
  deriving Show
lexer :: String -> [Token]
lexer [] = []
lexer (c:cs)
  | isSpace c = lexer cs
  | isDigit c = lexNum (c:cs)
lexer (';':cs) = TokenSemiColon : lexer cs
lexer (':':cs) = TokenColon : lexer cs
lexer ('u':cs) = TokenU : lexer cs
lexer ('\ESC':'[':cs) = TokenCSI : lexer cs
lexNum cs =  let
  (num,rest) = span isDigit cs
  in TokenInt (read num) : lexer rest
__getCSI acc= getChar >>= (\x -> if (x == 'u') then pure (reverse (x:acc) )else __getCSI (x:acc))
getCSI = __getCSI ""
pushFlag = putStr "\x1b\x5b\&>8u"
popFlag = putStr "\x1b\x5b\&<u"

main = do
  hSetEcho stdin False
  hSetBuffering stdin NoBuffering
  pushFlag
  sequence (replicate 10 ( getCSI >>= print . keyboard . lexer ))
  popFlag 
}
