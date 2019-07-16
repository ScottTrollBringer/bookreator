module State exposing (init, subscriptions, update)

import Types exposing (..)
import Rest exposing (..)

init : () -> ( Model, Cmd Msg )
init _ =
    ( initialModel, Cmd.batch [ initPage, initBook ] )

initPage : Cmd Msg
initPage =
    getFirstPage GetPage pageDecoder


initBook : Cmd Msg
initBook =
    getBook GetBook bookDecoder


initialModel : Model
initialModel =
    { book = { title = "Loading..." }
    , page = { numero = 0, content = "Loading...", choices = [] }
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetPage result ->
            case result of
                Ok printPage ->
                    ( { model | page = printPage }, Cmd.none )

                Err _ ->
                    nothingToShow model

        GetBook result ->
            case result of
                Ok printTitle ->
                    ( { model | book = printTitle }, Cmd.none )

                Err _ ->
                    nothingToShow model

        PrintPage numero ->
            ( model, getPageByNumero numero GetPage pageDecoder )


nothingToShow : Model -> ( Model, Cmd Msg )
nothingToShow model =
    ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
