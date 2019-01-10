module FuzzTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (..)
import Test exposing (..)


twoTimesTests : Test
twoTimesTests =
    describe "twoTimes"
        [ fuzz int "Multiply any int by 2 in Elm" <|
            \num ->
                twoTimes num |> Expect.equal (num + num)
        ]


twoTimes : Int -> Int
twoTimes x =
    2 * x