module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (type_)
import Html.Events exposing (..)
import Html.Attributes exposing (..)

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
    , newName : Maybe String
    }


init : Model
init =
    { greetings = "Hello World"
    , users = ["Homer","lisa"]
    , newName = Nothing
    }


type Msg    -- trida eventu
    = NoOp
    | NewName String
    | Save


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model
             
        NewName inputName ->
            { model | newName = Just inputName }

        Save ->
            -- { model | users = model.newName :: model.users }
            { model 
                | users = 
                    case model.newName of
                    Just name ->
                        name :: model.users

                    Nothing ->
                        model.users 
            }
            


view : Model -> Html Msg    --msg je event
view model =
    let
        nameValue2 =
            case model.newName of
                Just name ->
                    name

                Nothing ->
                    ""

        nameValue =
            Maybe.withDefault "" model.newName        
    in

    div []
        [ h1 [] [ text model.greetings ]
        , input [onInput NewName ] []
        , button [onClick Save] [ text "Save"]
        , div [] 
            (List.map viewUser model.users)
        ]

viewUser : String -> Html Msg
viewUser user = 
    div [] [ text user ]

