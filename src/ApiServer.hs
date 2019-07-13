{-# LANGUAGE OverloadedStrings #-}

module ApiServer
    ( runServer
    ) where

import Control.Monad.Trans.Reader           (runReaderT)
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Web.Scotty.Trans                     (get, middleware, scottyT)
import Database.Bolt                        (BoltCfg)
import Routes
import Data

type Port = Int

runServer :: Port -> BoltCfg -> IO ()
runServer port config = do state <- constructState config
                           scottyT port (`runReaderT` state) $ do
                             middleware logStdoutDev
                             get  "/"             mainRoute
                             get  "/js"           jsRoute
                             get  "/css"          cssRoute
                             get  "/page"         pageRoute
                             get  "/book"         bookRoute
