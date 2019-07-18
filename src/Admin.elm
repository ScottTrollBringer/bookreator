module Admin exposing (..)

import Browser
import Html exposing (Html, text, h1, table, tr, td)


main =
    Browser.element { init = init, update = update, subscriptions = subscriptions, view = view }


type Msg = Increment

type Model = Placeholder


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
  table [] [
    tr [] [
      td [] [ h1 [] [ text "MyBalls" ] ]
    ]
  ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
