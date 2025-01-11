module Transducer 
  (
    transducer
  ) where

import Data.Char
import GHC.Buffer



data Input
  = MoveRightF Char
  | MoveRightT Char
  | MoveLeftF Char
  | MoveLeftT Char
  | RepeatMove
  | BackwardsRepeatMove
  | MoveToLineStart
  | MoveToLineEnd
  | MoeveToStart
  | MoveToEnd
  | Word
  | Back
  | End
  | Insert Char
  | Delete
  deriving (Eq,Show)

aStupidAction :: IO ()
aStupidAction = uninterruptibleMask $ \restore -> do
  :
data TransducerState = 
  Transducer
  { _lineBuffer :: CharBuffer
  , _ 
  }
