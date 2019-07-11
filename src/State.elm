module State exposing (init, subscriptions, update)

import Types exposing (..)

init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.none )


initialModel : Model
initialModel =
    { bookTitle = ""
    , displayedPage = "1"
    , numeroActualPage = ""
    , numeroChildPages = []
    , loading = False
    , resultToShow = ""
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PrintPage ->
            ( { model | displayedPage = "1" }, Cmd.none )

        ChangeToNextPage newCountry ->
            ( { model | displayedPage = newCountry }, Cmd.none )

        GetNextPage result ->
            case result of
                Ok nextPage ->
                    ( { model | displayedPage = nextPage, loading = False, resultToShow = "page" }, Cmd.none )

                Err _ ->
                    nothingToShow model


nothingToShow : Model -> ( Model, Cmd Msg )
nothingToShow model =
    ( { model | loading = False, resultToShow = "noResults" }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
