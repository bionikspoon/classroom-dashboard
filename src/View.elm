module View exposing (view)

import Html exposing (Html, div, text)
import Model exposing (Model, Route(..))
import Msgs exposing (Msg)
import Users.List


view : Model -> Html Msg
view model =
    div []
        [ viewRoute model ]


viewRoute : Model -> Html Msg
viewRoute model =
    case model.route of
        UsersRoute ->
            Users.List.view model.users

        UserRoute userId ->
            text ("User: " ++ userId)

        NotFoundRoute ->
            text "404"

        HomeRoute ->
            text "home"
