module Admin exposing (..)

import Browser
import Html exposing (Html, table, text, tr, td, button, textarea, input, h1)
import Html.Attributes exposing (cols, rows, align, id, placeholder, size)


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


type Msg
    = Increment

type Model
    = Placeholder


init : () -> ( Model, Cmd Msg )
init _ =
    ( Placeholder, Cmd.none )


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Increment ->
      ( model, Cmd.none )


view : Model -> Html Msg
view model =
    table [ align "center" ]
        [ tr []
          [ td [] [ h1 [ id "bookTitle" ] [ text "Create a page" ] ]
          ]
        , tr []
          [ td [] [ textarea [ cols 80, rows 30, id "pageContent" ] [] ]
          ]
        , tr []
          [ td [] [ input [ placeholder "Optional 1st choice", id "choiceOne", size 80 ] [] ]
          ]
        , tr []
          [ td [] [ input [ placeholder "Optional 2nd choice", id "choiceTwo", size 80 ] [] ]
          ]
        , tr []
          [ td [] [ input [ placeholder "Page number", id "pageNumber" ] [] ]
          ]
        , tr []
          [ td [] [ button [] [ text "Create page" ] ]
          ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
