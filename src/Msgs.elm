module Msgs exposing (Msg(..))

import Model exposing (User)
import RemoteData exposing (WebData)


type Msg
    = NoOp
    | UsersResponse (WebData (List User))
