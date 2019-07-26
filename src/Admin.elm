module Admin exposing (..)

import Browser
import Html exposing (Html, table, text, tr, td, button, textarea, input, h1, hr, select)
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
          [ td [] [ input [ placeholder "Page number", id "pageNumber" ] []
                  , button [ id "createPage" ] [ text "Create a page" ]
                  , button [ id "modifyPage" ] [ text "Modify a page" ]
                  , button [ id "deletePage" ] [ text "Delete page" ]
                  ]
          ]
        , hr [] []
        , tr []
          [ td [] [ text "Father page: "
                  , select [ id "fatherPage" ] []
                  , text "Child page: "
                  , select [ id "childPage" ] []
                  ]
          ]
        , tr []
          [ td [] [ input [ placeholder "Write here the choice that causes to go from father page to child page", id "linkDescription", cols 80 ] [] ]
          ]
        , tr []
          [ td [] [ button [ id "createLink" ] [ text "Create a new link" ]
                  , button [ id "modifyLink" ] [ text "Modify link" ]
                  , button [ id "deleteLink" ] [ text "Delete link" ]
                  ]
          ]
        ]


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
