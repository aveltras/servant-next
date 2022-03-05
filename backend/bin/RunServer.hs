module RunServer where

import Lib
import Network.Wai.Handler.Warp

main :: IO ()
main = run 8080 app
