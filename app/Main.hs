{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Default
import System.Environment   (getEnv)
import Database.Bolt
import ApiServer

main :: IO ()
main =  do
          pass <- getEnv "GRAPHENEDB_BOLT_PASSWORD"
          config <- return def { user = "neo4j", password = "neo5j", host = "localhost", port = 7687 }
          runServer 8080 config
