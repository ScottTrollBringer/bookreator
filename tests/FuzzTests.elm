module FuzzTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Rest exposing (..)
import Json.Decode exposing (Decoder)

decodesBook : Test
decodesBook =
    test "Properly decodes a Book node" <|
        \() ->
            let
                input =
                    """
                      { "title" : "MyBalls"
                      }
                    """
                decodedOutput =
                    Json.Decode.decodeString
                        bookDecoder input
            in
                Expect.equal decodedOutput
                    (Ok
                        { title = "MyBalls"
                        }
                    )


decodesPage : Test
decodesPage =
    test "Properly decodes a Page node" <|
        \() ->
            let
                input =
                    """
                      { "numero" : "42"
                      , "content" : "Nice stuff."
                      }
                    """
                decodedOutput =
                    Json.Decode.decodeString
                        pageDecoder input
            in
                Expect.equal decodedOutput
                    (Ok
                        { numero = "42"
                        , content = "Nice stuff."
                        }
                    )


buildUrlWithQueryString : Test
buildUrlWithQueryString =
    test "Properly creates an URL with 1 argument in QueryString" <|
        \() ->
            let
                url = "/page"
                numPage = "1"
                createURL = createUrlPage url numPage
            in
                Expect.equal createURL ("/page/?numero=1")
