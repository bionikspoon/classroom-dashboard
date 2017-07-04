module Users.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Keyed
import Model exposing (Model, User)
import Msgs exposing (..)
import RemoteData exposing (RemoteData(..), WebData)


view : Model -> Html Msg
view model =
    div []
        [ nav
        , maybeUsers model.users
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-navy" ]
        [ div [ class "left p2" ] [ text "Users" ] ]


maybeUsers : WebData (List User) -> Html Msg
maybeUsers maybeUsers =
    case maybeUsers of
        NotAsked ->
            text ""

        Loading ->
            text "loading"

        Failure error ->
            text ("Error: " ++ toString error)

        Success users ->
            viewUsers users


viewUsers : List User -> Html Msg
viewUsers users =
    Html.Keyed.node "section" [] (List.map userRow users)


userRow : User -> ( String, Html Msg )
userRow user =
    let
        node =
            div [] [ text user.full_name ]
    in
        ( user.id, node )
