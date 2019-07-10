module Main exposing (main, view)

import Browser
import State
import Html exposing (Html, div, text)
import Types exposing (..)

main =
    Browser.element { init = State.init, update = State.update, subscriptions = State.subscriptions, view = view }


view : Model -> Html Msg
view model =
    div []
        [ text "Trololol"
        ]
