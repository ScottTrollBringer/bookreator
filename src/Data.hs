{-# LANGUAGE OverloadedStrings #-}

module Data
    ( ServerState (..)
    , WebM
    , constructState
--    , queryPage
    , queryFirstPage
    , queryBook
    ) where

import Control.Monad.Trans.Reader (ReaderT (..))
import Data.Pool                  (Pool, createPool)
import Database.Bolt
import Type
import Data.Text hiding           (head)
import Data.Map.Strict            (fromList)

-- |A pool of connections to Neo4j server
newtype ServerState = ServerState { pool :: Pool Pipe }

-- |Reader monad over IO to store connection pool
type WebM = ReaderT ServerState IO

-- |Returns a single Page
--queryPage :: Text -> BoltActionT IO Page
--queryPage num = do
--                result <- head <$> queryP cypher params
--                T content <- result `at` "content"
--                T numero <- result `at` "numero"
--                return $ Page content numero
--            where cypher =  "MATCH (page:Page {numero:{num}})" <>
--                            "RETURN page.content as content, page.numero as numero LIMIT 1"
--                  params = fromList [("num", T num)]


-- |Returns the first Page
queryFirstPage :: BoltActionT IO Page
queryFirstPage = do
                result <- head <$> query cypher
                T content <- result `at` "content"
                I numero <- result `at` "numero"
                return $ Page content numero
            where cypher =  "MATCH (page:Page {numero:1})" <>
                            "RETURN page.content as content, page.numero as numero LIMIT 1"


-- |Returns a single Page
queryBook :: BoltActionT IO Book
queryBook = do
                result <- head <$> query cypher
                T title <- result `at` "title"
                return $ Book title
            where cypher =  "MATCH (book:Book)" <>
                            "RETURN book.title as title LIMIT 1"


-- |Create pool of connections (4 stripes, 500 ms timeout, 1 resource per stripe)
constructState :: BoltCfg -> IO ServerState
constructState bcfg = do
                        pool <- createPool (connect bcfg) close 4 500 1
                        return (ServerState pool)
