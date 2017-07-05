module Update exposing (update)

import Model exposing (Model)
import Msgs exposing (Msg)
import Navigation
import Routing exposing (route)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.UsersResponse users ->
            ( { model | users = users }, Cmd.none )

        Msgs.NewUrl url ->
            ( model, Navigation.newUrl url )

        Msgs.UrlChange location ->
            ( { model | route = route location }, Cmd.none )
