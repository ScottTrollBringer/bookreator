module FuzzTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Rest exposing (..)
import Json.Decode exposing (Decoder, decodeValue)
import Json.Encode as Json


decodesPage : Test
decodesPage =
    describe "Decode Page"
        [ fuzz2 Fuzz.string Fuzz.string "Properly decodes a Page node" <|
            \content numero ->
                let
                    json =
                        Json.object
                            [ ( "content", Json.string content )
                            , ( "numero", Json.string numero )
                            ]
                in
                decodeValue pageDecoder json
                    |> Expect.equal
                        (Ok { content = content, numero = numero })
        ]


decodesBook : Test
decodesBook =
    describe "Decode Book"
        [ fuzz Fuzz.string "Properly decodes a Book node" <|
            \title ->
                let
                    json =
                        Json.object
                            [ ( "title", Json.string title )
                            ]
                in
                decodeValue bookDecoder json
                    |> Expect.equal
                        (Ok { title = title })
        ]
