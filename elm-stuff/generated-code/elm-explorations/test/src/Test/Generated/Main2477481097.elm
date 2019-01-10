module Test.Generated.Main2477481097 exposing (main)

import FuzzTests
import Example

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "FuzzTests" [FuzzTests.twoTimesTests],     Test.describe "Example" [Example.suite] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 95944142744326, processes = 4, paths = ["C:\\Users\\Ouaip\\Documents\\bookreator\\tests\\Example.elm","C:\\Users\\Ouaip\\Documents\\bookreator\\tests\\FuzzTests.elm"]}