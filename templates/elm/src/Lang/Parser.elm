module Lang.Parser exposing (Error, parse)

import Lang.AST as AST exposing (..)
import Lang.Lexer as L
import Parser as P exposing ((|.), (|=), Parser)


type alias Error =
    List P.DeadEnd


parse : String -> Result Error AST.Program
parse =
    P.run program


program : Parser AST.Program
program =
    P.succeed Program
        |. L.spaces
        |= expr
        |. P.end


expr : Parser Expr
expr =
    constExpr


constExpr : Parser Expr
constExpr =
    P.map Const number


number : Parser Number
number =
    L.digits
