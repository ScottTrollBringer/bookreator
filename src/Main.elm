module Main exposing (main, view)

import Browser
import State
import Html exposing (Html, table, text, tr, td, button, textarea, h1, h2)
import Html.Attributes exposing (disabled, cols, rows, align)
import Types exposing (..)

main =
    Browser.element { init = State.init, update = State.update, subscriptions = State.subscriptions, view = view }


view : Model -> Html Msg
view model =
    table [ align "center" ]
        [ tr []
          [ td [] [ h1 [] [ text model.book.title ] ]
          ]
        , tr []
          [ td [] [ h2 [ align "center" ] [ text ("Page : " ++ model.displayedPage) ] ]
          ]
        , tr []
          [ td [] [ textarea [ disabled True, cols 80, rows 30 ] [ text model.content ] ]
          ]
        , tr []
          [ td [ align "center" ] [ button [] [ text "Choix 1" ]
                  , button [] [ text "Choix 2" ]
                  ]
          ]
        ]
