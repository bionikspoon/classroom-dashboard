module Main exposing (main)

import Commands exposing (getUsers)
import Model exposing (Model, initialModel)
import Msgs exposing (Msg)
import Navigation exposing (Location)
import Routing exposing (route)
import Update exposing (update)
import View exposing (view)


init : Location -> ( Model, Cmd Msg )
init location =
    ( initialModel <| route location, getUsers )


main : Program Never Model Msg
main =
    Navigation.program Msgs.UrlChange
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
