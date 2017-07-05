module Users.List exposing (view)

import Components.Nav
import Html exposing (Html, div, iframe, text)
import Html.Attributes exposing (class, srcdoc, style)
import Html.Keyed
import Http
import Model exposing (User)
import Msgs exposing (Msg)
import RemoteData exposing (WebData)


view : WebData (List User) -> Html Msg
view response =
    div []
        [ Components.Nav.view "Users"
        , maybeUsersList response
        ]


maybeUsersList : WebData (List User) -> Html Msg
maybeUsersList response =
    case response of
        RemoteData.NotAsked ->
            text ""

        RemoteData.Loading ->
            text "loading"

        RemoteData.Failure (Http.BadStatus error) ->
            iframe [ class "border-none overflow-auto absolute top-0 left-0 col-12", srcdoc error.body ] []

        RemoteData.Failure error ->
            text (toString error)

        RemoteData.Success users ->
            Html.Keyed.node "section" [] (List.map userRow users)


userRow : User -> ( String, Html Msg )
userRow user =
    let
        node =
            div [] [ text user.full_name ]
    in
        ( user.id, node )
