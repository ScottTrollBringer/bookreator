{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings   #-}

module Type where

import Data.Aeson     (ToJSON (..), object, (.=))
import Data.Text      (Text)
import Database.Bolt  (Value (..), RecordValue (..), Node (..), at)

data Page = Page { content  :: Text
                 , numero :: Int
                 , choices :: [ Choice ]
                 } deriving (Show, Eq)

newtype Book = Book { title  :: Text
                 } deriving (Show, Eq)

newtype Choice = Choice { reason  :: Text
                 } deriving (Show, Eq)

instance ToJSON Page where
  toJSON (Page c n l) = object [ "content" .= c, "numero" .= n, "choices" .= l ]

instance ToJSON Book where
  toJSON (Book t) = object [ "title" .= t ]

instance ToJSON Choice where
  toJSON (Choice r) = object [ "reason" .= r ]

-- |Converts some BOLT value to 'Choice'
toChoice :: Monad m => Value -> m Choice
toChoice (L [T reason]) = return $ Choice reason
toChoice _                          = fail "Not a Choice value"
