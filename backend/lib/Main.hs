{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Text
import Network.Wai.Handler.Warp
import Servant
import Servant.OpenApi

main :: IO ()
main = run 8080 app

app :: Application
app = serve api server

server :: Handler Text
server = pure "not implemented"

type API = Get '[JSON] Text

api :: Proxy API
api = Proxy
