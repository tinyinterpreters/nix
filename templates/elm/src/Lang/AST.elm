module Lang.AST exposing
    ( Expr(..)
    , Number
    , Program(..)
    )


type Program
    = Program Expr


type Expr
    = Const Number


type alias Number =
    Int
