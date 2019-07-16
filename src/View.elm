module View exposing (viewBook)

import Html exposing (Html, table, text, tr, td, button, textarea, h1, h2)
import Html.Attributes exposing (disabled, cols, rows, align, id)
import Html.Events exposing (onClick)
import Types exposing (..)


viewBook : Model -> Html Msg
viewBook model =
    table [ align "center" ]
        [ tr []
          [ td [] [ h1 [ id "bookTitle" ] [ text model.book.title ] ]
          ]
        , tr []
          [ td [] [ h2 [ align "center", id "pageNumber" ] [ text ("Page : " ++ (String.fromInt model.page.numero)) ] ]
          ]
        , tr []
          [ td [] [ textarea [ disabled True, cols 80, rows 30, id "pageContent" ] [ text model.page.content ] ]
          ]
        , printButtons model
        ]


printButtons : Model -> Html Msg
printButtons model =
  tr []
    ([]
      ++ List.map renderButtons model.page.choices
    )


renderButtons : Choice -> Html Msg
renderButtons choice =
  tr []
    [
     td [ align "left" ]
       [ button [ onClick (PrintPage "2") ] [ text choice.reason ]
       ]
    ]
