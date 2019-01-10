module Test.Generated.Main1898076906 exposing (main)

import FuzzTests

import Test.Reporter.Reporter exposing (Report(..))
import Console.Text exposing (UseColor(..))
import Test.Runner.Node
import Test

main : Test.Runner.Node.TestProgram
main =
    [     Test.describe "FuzzTests" [FuzzTests.twoTimesTests] ]
        |> Test.concat
        |> Test.Runner.Node.run { runs = Nothing, report = (ConsoleReport UseColor), seed = 346889064755583, processes = 4, paths = ["C:\\Users\\Ouaip\\Documents\\bookreator\\tests\\FuzzTests.elm"]}