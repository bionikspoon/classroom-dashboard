module Components.Nav exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class)
import Msgs exposing (Msg)


view : String -> Html Msg
view title =
    div [ class "clearfix mb2 white bg-navy" ]
        [ div [ class "left p2" ] [ text title ] ]
