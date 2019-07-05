{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Default
import System.Environment   (getEnv)
import Database.Bolt
import ApiServer
import Data.Text as T

main :: IO ()
main =  do
          pass <- T.pack <$> getEnv "GRAPHENEDB_BOLT_PASSWORD"
          user <- T.pack <$> getEnv "GRAPHENEDB_BOLT_USER"
          url  <- T.pack <$> getEnv "GRAPHENEDB_BOLT_URL"
          config <- return def { user = "neo4j", password = pass, host = "localhost", port = 7687 }
          runServer 8080 config
