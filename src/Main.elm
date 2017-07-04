module Main exposing (..)

import Html exposing (Html, div)
import Http
import Json.Decode exposing (Decoder, field, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Model exposing (Model, User, initialModel)
import Msgs exposing (Msg(..))
import RemoteData
import Users.List


getUsers : Cmd Msg
getUsers =
    Http.get "/api/users/" decodeUsers
        |> RemoteData.sendRequest
        |> Cmd.map UsersResponse


decodeUsers : Decoder (List User)
decodeUsers =
    field "data" (list decodeUser)


decodeUser : Decoder User
decodeUser =
    decode User
        |> required "id" string
        |> required "full_name" string



---- INIT ----


init : ( Model, Cmd Msg )
init =
    ( initialModel, getUsers )



---- UPDATE ----


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        UsersResponse users ->
            ( { model | users = users }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ Users.List.view model ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
