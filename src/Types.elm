module Types exposing (Model, Msg(..))

import Http

type Msg
    = PrintPage
    | GetNextPage (Result Http.Error String)
    | ChangeToNextPage String


type alias Model =
    { bookTitle : String
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
