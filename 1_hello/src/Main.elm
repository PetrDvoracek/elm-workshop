module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (type_)
import Html.Events exposing (..)

main : Program () Model Msg{- deklaruje, co vraci funkce main -}
main =
    Browser.sandbox {- sandbox je nejjednodussi, nicmene pouzivaji se i jine-}
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { greetings : String
    , users : List String
    }


init : Model
init =
    { greetings = "Hello World"
    , users = ["Homer","lisa"]
    }


type Msg
    = NoOp
    | NewName String


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model
             
        NewName inputName ->
            { model | users = inputName :: model.users }
            


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.greetings ]
        , input [onInput NewName ] []
        , div [] 
            (List.map viewUser model.users)
        ]

viewUser : String -> Html Msg
viewUser user = 
    div [] [ text user ]

