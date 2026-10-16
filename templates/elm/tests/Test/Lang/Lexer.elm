module Test.Lang.Lexer exposing (suite)

import Lang.Lexer as L
import Parser as P
import Test exposing (Test, describe)
import Test.Helpers exposing (testOk)


suite : Test
suite =
    describe "Lang.Lexer"
        [ describe "digits" <|
            List.map (testOk <| P.run L.digits)
                [ ( "123", Just 123 )
                , ( "123 ", Just 123 )
                , ( "123  ", Just 123 )
                , ( "123abc", Just 123 )
                , ( " 123", Nothing )
                , ( "onetwothree", Nothing )
                ]
        ]
