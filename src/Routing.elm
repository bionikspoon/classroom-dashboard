module Routing exposing (..)

import Model exposing (Route(..))
import Navigation exposing (Location)
import UrlParser exposing ((</>), Parser, map, oneOf, parsePath, s, string, top)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map UsersRoute (s "users")
        , map UserRoute (s "users" </> string)
        ]


route : Location -> Route
route location =
    case (parsePath matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
