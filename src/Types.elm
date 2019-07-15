module Types exposing (Model, Msg(..), Book, Page)

import Http

type Msg
    = GetPage (Result Http.Error Page)
    | GetBook (Result Http.Error Book)
    | PrintPage String


type alias Model =
    { book : Book
    , page : Page
    }

type alias Book =
    { title : String
    }

type alias Page =
    { content : String
    , numero : Int
    }
