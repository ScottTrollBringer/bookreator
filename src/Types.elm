module Types exposing (Model, Msg(..), Book, Page)

import Http

type Msg
    = PrintPage
    | GetPage (Result Http.Error Page)
    | ChangeToNextPage String
    | GetBook (Result Http.Error Book)


type alias Model =
    { book : Book
    , page : Page
    , content : String
    , displayedPage : String
    , numeroActualPage : String
    , numeroChildPages : List String
    , loading : Bool
    , resultToShow : String
    }

type alias Book =
    { title : String
    }

type alias Page =
    { content : String
    , numero : String
    }
