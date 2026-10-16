module Test.Lang.Interpreter exposing (suite)

import Lang.Interpreter as I exposing (Value(..))
import Test exposing (Test, describe)
import Test.Helpers exposing (testOk)


suite : Test
suite =
    describe "Lang.Interpreter"
        [ describe "run" <|
            List.map (testOk I.run)
                [ ( "123", Just (VNumber 123) )
                , ( "123 ", Just (VNumber 123) )
                , ( "123  ", Just (VNumber 123) )
                , ( " 123", Just (VNumber 123) )
                , ( "  123", Just (VNumber 123) )
                , ( "123abc", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]
