module Rest exposing (getBook, getPageByNumero, bookDecoder, pageDecoder, createUrlPage, getFirstPage)

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


getPageByNumero : String -> (Result Http.Error a -> Msg) -> Decoder a -> Cmd Msg
getPageByNumero numero message decoder =
    Http.get
        { url = createUrlPage "/page" numero
        , expect = Http.expectJson message decoder
        }


getFirstPage : (Result Http.Error a -> Msg) -> Decoder a -> Cmd Msg
getFirstPage message decoder =
    Http.get
        { url = "/page/first"
        , expect = Http.expectJson message decoder
        }


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
        (field "numero" Json.Decode.int)
