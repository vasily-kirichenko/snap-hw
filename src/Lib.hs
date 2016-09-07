{-# LANGUAGE OverloadedStrings #-}

module Lib
    ( someFunc
    ) where

import Snap

config :: Config Snap a
config = setAccessLog ConfigNoLog
    . setErrorLog ConfigNoLog
    . setPort 8000
    $ defaultConfig

someFunc :: IO ()
someFunc = httpServe config site

site :: Snap ()
site =
  ifTop (writeBS "Hello World!")
