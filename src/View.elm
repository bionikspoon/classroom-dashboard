module View exposing (view)

import Html exposing (Html, div)
import Model exposing (Model)
import Msgs exposing (Msg)
import Users.List


view : Model -> Html Msg
view model =
    div []
        [ Users.List.view model.users ]
