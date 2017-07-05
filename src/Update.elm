module Update exposing (update)

import Model exposing (Model)
import Msgs exposing (Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msgs.NoOp ->
            ( model, Cmd.none )

        Msgs.UsersResponse users ->
            ( { model | users = users }, Cmd.none )
