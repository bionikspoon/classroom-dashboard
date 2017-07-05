module Model exposing (..)

import RemoteData exposing (WebData)


type Route
    = NotFoundRoute
    | HomeRoute
    | UsersRoute
    | UserRoute PrimaryKey


type alias PrimaryKey =
    String


type alias User =
    { id : PrimaryKey
    , full_name : String
    }


type alias Model =
    { route : Route
    , users : WebData (List User)
    }


initialModel : Route -> Model
initialModel route =
    { route = route
    , users = RemoteData.NotAsked
    }
