module Msgs exposing (..)

import RemoteData exposing (WebData)
import Model exposing (..)


type Msg
    = NoOp
    | UsersResponse (WebData (List User))
