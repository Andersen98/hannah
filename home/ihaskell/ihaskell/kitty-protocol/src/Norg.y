{
module Norg where
import Data.Text.ICU
-- # General_Category=Space_Separator
-- 
isSpace x = elem x ["\x20" -- 0020          ; Zs #       SPACE
  ,"\xA0" -- 00A0          ; Zs #       NO-BREAK SPACE
  ,"\x1680" -- 1680          ; Zs #       OGHAM SPACE MARK
  ,"\x2000" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2001" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2002" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2003" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2004" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2005" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2006" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2007" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2008" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x2009" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x200A" -- 2000..200A    ; Zs #  [11] EN QUAD..HAIR SPACE
  ,"\x202F" -- 202F          ; Zs #       NARROW NO-BREAK SPACE
  ,"\x205F" -- 205F          ; Zs #       MEDIUM MATHEMATICAL SPACE
  ,"\x3000" -- 3000          ; Zs #       IDEOGRAPHIC SPACE
  ]
  enPosixLocal = Locale "en_US_POSIX"
  (breaks $ breakCharacter enPosixLocal) 
 }
