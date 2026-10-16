module Test.Lang.Parser exposing (suite)

import Lang.AST as AST exposing (..)
import Lang.Parser as P
import Test exposing (Test, describe)
import Test.Helpers exposing (testOk)


suite : Test
suite =
    describe "Lang.Parser"
        [ describe "parse" <|
            List.map (testOk P.parse)
                [ ( "123", Just (Program (Const 123)) )
                , ( "123 ", Just (Program (Const 123)) )
                , ( "123  ", Just (Program (Const 123)) )
                , ( " 123", Just (Program (Const 123)) )
                , ( "  123", Just (Program (Const 123)) )
                , ( "123abc", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]
