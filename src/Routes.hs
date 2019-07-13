{-# LANGUAGE OverloadedStrings #-}

module Routes where

import Control.Monad.Trans        (lift, liftIO)
import Control.Monad.Trans.Reader (ask)
import Data.Pool                  (withResource)
import Data.Text.Lazy             (Text, toStrict)
import Database.Bolt
import Web.Scotty.Trans           (ActionT, file, json, param)
import Data

-- Run BOLT action in scotty 'ActionT' monad tansformer
runQ :: BoltActionT IO a -> ActionT Text WebM a
runQ act = do ss <- lift ask
              liftIO $ withResource (pool ss) (`run` act)

-- Display home page
mainRoute :: ActionT Text WebM ()
mainRoute = file "views/index.html"

-- Mandatory to display Elm code inside the home page
jsRoute :: ActionT Text WebM ()
jsRoute = file "views/main.js"

-- Print the page content
pageRoute :: ActionT Text WebM ()
pageRoute = do num <- param "numero" :: ActionT Text WebM Text
               results <- runQ $ queryPage $ toStrict num
               json results

-- Print the book title
bookRoute :: ActionT Text WebM ()
bookRoute = do results <- runQ $ queryBook
               json results
