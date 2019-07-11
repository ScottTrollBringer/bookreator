module Rest exposing (..)

import Http
import Types exposing (Book, Page)
import Json.Decode exposing (Decoder, map, map2, field)
import Url.Builder
import Types exposing (Msg(..))


createUrlPage : String -> String -> String
createUrlPage urlInput numPage =
    Url.Builder.crossOrigin urlInput
        []
        [ Url.Builder.string "numero" numPage
        ]


getBook : (Result Http.Error a -> Msg) -> Decoder a -> Cmd Msg
getBook message decoder =
    Http.get
        { url = "/book"
        , expect = Http.expectJson message decoder
        }


bookDecoder : Decoder Book
bookDecoder =
    map Book
      (field "title" Json.Decode.string)


pageDecoder : Decoder Page
pageDecoder =
    map2 Page
        (field "content" Json.Decode.string)
        (field "numero" Json.Decode.string)
