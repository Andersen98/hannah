{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module System.Console.Utils.Kitty.Parser
 (
    keyboard
  , KittyEvent (..)
  , getCSI
  , lexer
 ) where
import Data.Char
import System.IO
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.1.1

newtype HappyAbsSyn t4 t5 t6 t7 t8 t9 = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: t4 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: t5 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: t6 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: t7 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: t8 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: t9 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> t9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyInTok :: (Token) -> (HappyAbsSyn t4 t5 t6 t7 t8 t9)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t4 t5 t6 t7 t8 t9) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x02\x00\x01\x00\x01\x00\x00\x00\x02\x40\x00\x40\x00\x28\x00\x1c\x00\x00\x00\x02\x00\x02\xc0\x00\x20\x00\x40\x00\x08\x00\x00\x00\x02\x00\x00\x00\x01\x00\x01\x00\x00\x00\x00\x08\x00\x0c\x00\x04\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_keyboard","KittyEvent","Params","KeyCodes","Mods","CodePoints","CodePoints1","CSI","int","';'","':'","'u'","%eof"]
        bit_start = st Prelude.* 15
        bit_end = (st Prelude.+ 1) Prelude.* 15
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..14]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x04\x00\x04\x00\x0f\x00\x0c\x00\x0e\x00\x11\x00\x12\x00\x02\x00\xff\xff\x00\x00\x14\x00\x15\x00\x05\x00\x13\x00\x16\x00\x19\x00\x00\x00\x1a\x00\x00\x00\x1b\x00\x1c\x00\x00\x00\x00\x00\x1d\x00\x07\x00\x1e\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x18\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x00\x00\x00\x00\x00\x00\x00\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf3\xff\xf2\xff\x00\x00\xf4\xff\xfe\xff\xf7\xff\xee\xff\xf5\xff\x00\x00\xf1\xff\x00\x00\xef\xff\x00\x00\xec\xff\xfa\xff\xeb\xff\xea\xff\xf6\xff\x00\x00\xf8\xff\xfc\xff\xf9\xff\xed\xff\x00\x00\xfb\xff\xf0\xff\xe9\xff\xfd\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x02\x00\x03\x00\x04\x00\x02\x00\x01\x00\x04\x00\x02\x00\x03\x00\x02\x00\x03\x00\x01\x00\x02\x00\x04\x00\x05\x00\x04\x00\x05\x00\x02\x00\x06\x00\x05\x00\x03\x00\x02\x00\x04\x00\x03\x00\x00\x00\x04\x00\x04\x00\x02\x00\x02\x00\xff\xff\x03\x00\x02\x00\x04\x00\x03\x00\x02\x00\xff\xff\x03\x00\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x03\x00\x10\x00\x16\x00\x17\x00\x16\x00\x1b\x00\x04\x00\x05\x00\x13\x00\x14\x00\x19\x00\x14\x00\x07\x00\xff\xff\x0a\x00\x09\x00\x13\x00\x08\x00\x19\x00\x03\x00\x18\x00\x12\x00\x11\x00\x1f\x00\x00\x00\x1e\x00\x1c\x00\x1d\x00\x21\x00\x20\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 22) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22)
	]

happy_n_terms = 7 :: Prelude.Int
happy_n_nonterms = 6 :: Prelude.Int

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happySpecReduce_3  0# happyReduction_1
happyReduction_1 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn4
		 (happy_var_2 defaultKittyEvent
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happyReduce 6# 1# happyReduction_2
happyReduction_2 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	happyIn5
		 (\p -> (happy_var_1 . happy_var_3 . happy_var_5) p
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happyReduce 5# 1# happyReduction_3
happyReduction_3 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	case happyOut8 happy_x_5 of { happy_var_5 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_3 . happy_var_5) p
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happyReduce 5# 1# happyReduction_4
happyReduction_4 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut8 happy_x_4 of { happy_var_4 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_4 ) p
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happyReduce 4# 1# happyReduction_5
happyReduction_5 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut8 happy_x_4 of { happy_var_4 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_4) p
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happyReduce 5# 1# happyReduction_6
happyReduction_6 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_3) p
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happyReduce 4# 1# happyReduction_7
happyReduction_7 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_3) p
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_3  1# happyReduction_8
happyReduction_8 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_3 of { happy_var_3 -> 
	happyIn5
		 (\p ->  (happy_var_1 . happy_var_3) p
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happyReduce 4# 1# happyReduction_9
happyReduction_9 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (\p ->  happy_var_1 p
	) `HappyStk` happyRest}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_3  1# happyReduction_10
happyReduction_10 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (\p ->  happy_var_1 p
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_2  1# happyReduction_11
happyReduction_11 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (\p ->  happy_var_1 p
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_1  1# happyReduction_12
happyReduction_12 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (\p ->  happy_var_1 p
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_1  2# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	happyIn6
		 (\p -> p { _unicodeKeyCode = happy_var_1 }
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_3  2# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	case happyOutTok happy_x_3 of { (TokenInt happy_var_3) -> 
	happyIn6
		 (\p -> p { _unicodeKeyCode = happy_var_1, _shiftedKey = Just happy_var_3 }
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happyReduce 5# 2# happyReduction_15
happyReduction_15 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	case happyOutTok happy_x_3 of { (TokenInt happy_var_3) -> 
	case happyOutTok happy_x_5 of { (TokenInt happy_var_5) -> 
	happyIn6
		 (\p -> p { _unicodeKeyCode = happy_var_1, _shiftedKey = Just happy_var_3, _baseLayoutKey = Just happy_var_5}
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happyReduce 4# 2# happyReduction_16
happyReduction_16 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	case happyOutTok happy_x_4 of { (TokenInt happy_var_4) -> 
	happyIn6
		 (\p -> p { _unicodeKeyCode = happy_var_1, _baseLayoutKey = Just happy_var_4}
	) `HappyStk` happyRest}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_17 = happySpecReduce_1  3# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	happyIn7
		 (\p -> p { _modifierKey = happy_var_1}
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_18 = happySpecReduce_3  3# happyReduction_18
happyReduction_18 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	case happyOutTok happy_x_3 of { (TokenInt happy_var_3) -> 
	happyIn7
		 (\p -> p { _modifierKey = happy_var_1, _eventType = happy_var_3}
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_19 = happySpecReduce_2  3# happyReduction_19
happyReduction_19 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (TokenInt happy_var_2) -> 
	happyIn7
		 (\p -> p { _eventType = happy_var_2}
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_20 = happySpecReduce_1  4# happyReduction_20
happyReduction_20 happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	happyIn8
		 (\p -> p { _textAsCodePoints = happy_var_1}
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_21 = happySpecReduce_1  5# happyReduction_21
happyReduction_21 happy_x_1
	 =  case happyOutTok happy_x_1 of { (TokenInt happy_var_1) -> 
	happyIn9
		 ([happy_var_1]
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_22 = happySpecReduce_3  5# happyReduction_22
happyReduction_22 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_3 of { (TokenInt happy_var_3) -> 
	happyIn9
		 (happy_var_3 : happy_var_1
	)}}

happyNewToken action sts stk [] =
	happyDoAction 6# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	TokenCSI -> cont 1#;
	TokenInt happy_dollar_dollar -> cont 2#;
	TokenSemiColon -> cont 3#;
	TokenColon -> cont 4#;
	TokenU -> cont 5#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 6# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Prelude.Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Prelude.Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (Prelude.>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (Prelude.return)
happyThen1 m k tks = (Prelude.>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (Prelude.return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> HappyIdentity a
happyError' = HappyIdentity Prelude.. (\(tokens, _) -> parseError tokens)
keyboard tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {x' = happyOut4 x} in x'))

happySeq = happyDontSeq


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
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
