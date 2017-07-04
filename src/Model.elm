module Model exposing (..)

import RemoteData exposing (WebData)


type alias PrimaryKey =
    String


type alias User =
    { id : PrimaryKey
    , full_name : String
    }


type alias Model =
    { users : WebData (List User)
    }


initialModel : Model
initialModel =
    { users = RemoteData.Loading
    }
