module GenerateOpenAPI where

import Data.Aeson.Encode.Pretty (encodePretty)
import qualified Data.ByteString.Lazy.Char8 as BSL
import Data.Proxy (Proxy (..))
import Lib
import Servant.OpenApi

main :: IO ()
main = BSL.putStrLn $ encodePretty $ toOpenApi (Proxy :: Proxy API)
