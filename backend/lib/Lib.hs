{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}

module Lib where

import Data.Text
import Servant
import Servant.OpenApi

app :: Application
app = serve api server

server :: Handler Text
server = pure "not implemented"

type API = Get '[JSON] Text

api :: Proxy API
api = Proxy
