module Commands exposing (getUsers)

import Http
import Json.Decode exposing (Decoder, field, list, string)
import Json.Decode.Pipeline exposing (decode, required)
import Model exposing (User)
import Msgs exposing (Msg)
import RemoteData


usersPath : String
usersPath =
    "/api/users/"


getUsers : Cmd Msg
getUsers =
    Http.get usersPath decodeUsers
        |> RemoteData.sendRequest
        |> Cmd.map Msgs.UsersResponse


decodeUsers : Decoder (List User)
decodeUsers =
    field "data" <| list decodeUser


decodeUser : Decoder User
decodeUser =
    decode User
        |> required "id" string
        |> required "fullName" string
