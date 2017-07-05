module Msgs exposing (Msg(..))

import Model exposing (User)
import Navigation exposing (Location)
import RemoteData exposing (WebData)


type Msg
    = NoOp
    | UsersResponse (WebData (List User))
    | NewUrl String
    | UrlChange Location
