{-# LANGUAGE OverloadedStrings #-}

module Data
    ( ServerState (..)
    , WebM
    , constructState
    , queryPage
    ) where

import           Control.Monad.Trans.Reader (ReaderT (..))
import           Data.Pool                  (Pool, createPool)
import           Database.Bolt
import           Type

-- |A pool of connections to Neo4j server
newtype ServerState = ServerState { pool :: Pool Pipe }

-- |Reader monad over IO to store connection pool
type WebM = ReaderT ServerState IO

-- |Returns a single Page
queryPage :: BoltActionT IO Page
queryPage = do
                result <- head <$> query cypher
                T title <- result `at` "title"
                T numero <- result `at` "numero"
                return $ Page title numero
            where cypher =  "MATCH (page:Page {title:'Intro'})" <>
                            "RETURN page.title as title, page.numero as numero LIMIT 1"


-- |Create pool of connections (4 stripes, 500 ms timeout, 1 resource per stripe)
constructState :: BoltCfg -> IO ServerState
constructState bcfg = do
                        pool <- createPool (connect bcfg) close 4 500 1
                        return (ServerState pool)
