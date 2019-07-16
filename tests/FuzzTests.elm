module FuzzTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)
import Rest exposing (..)
import Json.Decode exposing (Decoder, decodeValue)
import Json.Encode as Json


decodesPage : Test
decodesPage =
        test "Properly decodes a Page node" <|
            \() ->
                let
                  json =
                    """
                      {
                        "content": "Intro",
                        "choices": [
                          {
                            "reason": "Choice 1."
                          },
                          {
                            "reason": "Choice 2."
                          }
                        ],
                        "numero": 1
                      }
                    """
                  output = Json.Decode.decodeString pageDecoder json
                in
                  Expect.equal output
                      (Ok
                          { content = "Intro"
                          , choices = [{reason = "Choice 1."},{reason = "Choice 2."}]
                          , numero = 1
                          }
                      )


decodesChoice : Test
decodesChoice =
    describe "Decode Choice"
        [ fuzz Fuzz.string "Properly decodes a Choice node" <|
            \reason ->
                let
                    json =
                        Json.object
                            [ ( "reason", Json.string reason )
                            ]
                in
                decodeValue choiceDecoder json
                    |> Expect.equal
                        (Ok { reason = reason })
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
