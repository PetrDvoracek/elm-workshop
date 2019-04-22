module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (..)
import Json.Decode as Decode
import Names


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { greetings : String
    , names : Names.Model
    }


init : Model
init =
    { greetings = "Hello World"
    , names = Names.init
    }


type Msg
    = NoOp
    | NamesMsg Names.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        NamesMsg subMsg ->
            let
                newNames =
                    Names.update subMsg model.names
            in
            { model | names = newNames }


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text model.greetings ]
        , Html.map NamesMsg (Names.view model.names)
        ]
