{-# LANGUAGE OverloadedStrings #-}

module Routes where

import           Control.Monad.Trans        (lift, liftIO)
import           Control.Monad.Trans.Reader (ask)
import           Data.Pool                  (withResource)
import           Data.Text.Lazy             (Text)
import           Database.Bolt
import           Web.Scotty.Trans           (ActionT, file, json)
import           Data

-- |Run BOLT action in scotty 'ActionT' monad tansformer
runQ :: BoltActionT IO a -> ActionT Text WebM a
runQ act = do ss <- lift ask
              liftIO $ withResource (pool ss) (`run` act)

mainRoute :: ActionT Text WebM ()
mainRoute = file "views/index.html"

pageRoute :: ActionT Text WebM ()
pageRoute = do
          results <- runQ queryPage
          json results