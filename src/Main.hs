{-# LANGUAGE OverloadedStrings #-}
module Main where

import Network.HTTP.Types.Status
import Network.Wai
import Network.Wai.Handler.Warp

app :: Application
app req respond = do
  putStrLn "Request received"
  respond $ responseLBS status200 [] "Hello World"

main :: IO ()
main = do
  putStrLn "Starting server on port 5000"
  run 5000 app
