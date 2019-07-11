{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings   #-}

module Type where

import Data.Aeson     (ToJSON (..), object, (.=))
import Data.Text      (Text)
import Database.Bolt  (Value (..), RecordValue (..), Node (..), at)

data Page = Page { content  :: Text
                 , numero :: Text
                 } deriving (Show, Eq)

instance ToJSON Page where
  toJSON (Page c n) = object [ "content" .= c, "numero" .= n ]

newtype Book = Book { title  :: Text
                 } deriving (Show, Eq)

instance ToJSON Book where
  toJSON (Book t) = object [ "title" .= t ]

-- |Converts some BOLT value to 'Page'
toPage :: Monad m => Value -> m Page
toPage v = do
               node :: Node <- exact v
               let props = nodeProps node
               title :: Text <- (props `at` "title") >>= exact
               numero :: Text <- (props `at` "numero") >>= exact
               return $ Page title numero
