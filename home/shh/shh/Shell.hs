{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
module Shell where
import Shh
import Data.List (sort)
import DBus
import DBus.Client
import Control.Applicative
import Options.Applicative
import Control.Exception (bracket)
import Control.Monad (forM_)
import Data.Attoparsec.ByteString
import System.Environment
import System.IO
import qualified Data.ByteString.Char8 as B
import qualified Data.Text as T
import Graphics.Vulkan
import Graphics.Vulkan.Core_1_2
import Foreign.Storable
import Foreign.Marshal.Alloc
import Foreign.C.String

$(loadEnv SearchPath)
