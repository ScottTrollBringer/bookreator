module Types exposing (Model, Msg(..))

import Http

type Msg
    = PrintPage
    | GetNextPage (Result Http.Error String)
    | ChangeToNextPage String


type alias Model =
    { displayedPage : String
    , loading : Bool
    , resultToShow : String
    }
