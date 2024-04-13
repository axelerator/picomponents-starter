module Route exposing (Route(..), fromUrl, href, replaceUrl, routeToString)

import Browser.Navigation as Nav
import Html exposing (Attribute)
import Html.Attributes as Attr
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>), Parser, oneOf, s)



-- ROUTING


type Route
    = Landing
    | Login
    | Logout
    | Signup
    | Home
    | Preferences


parser : Parser (Route -> a) a
parser =
    oneOf
        [ map Landing Parser.top
        , map Login (s "login")
        , map Logout (s "logout")
        , map Home (s "home")
        , map Signup (s "signup")
        , map Preferences (s "preferences")
        ]


mountedUnderRoot : Maybe String
mountedUnderRoot =
    Nothing


mountedUnder : Maybe String
mountedUnder =
    mountedUnderRoot


mountedUnderParser : Maybe (Parser a a)
mountedUnderParser =
    Maybe.map s mountedUnder


map : a -> Parser a b -> Parser (b -> c) c
map a p =
    case mountedUnderParser of
        Just prefix ->
            Parser.map a <|
                prefix
                    </> p

        Nothing ->
            Parser.map a p



-- PUBLIC HELPERS


href : Route -> Attribute msg
href targetRoute =
    Attr.href (routeToString targetRoute)


replaceUrl : Nav.Key -> Route -> Cmd msg
replaceUrl key route =
    Nav.replaceUrl key (routeToString route)


fromUrl : Url -> Maybe Route
fromUrl url =
    let
        _ =
            Debug.log "Url" ( mountedUnder, url )
    in
    Parser.parse parser url


routeToString : Route -> String
routeToString page =
    "/" ++ String.join "/" (routeToPieces page)



-- INTERNAL


routeToPieces : Route -> List String
routeToPieces page =
    let
        prefix =
            Maybe.map List.singleton mountedUnder
                |> Maybe.withDefault []
    in
    prefix
        ++ (case page of
                Landing ->
                    []

                Login ->
                    [ "login" ]

                Logout ->
                    [ "logout" ]

                Home ->
                    [ "home" ]

                Signup ->
                    [ "signup" ]

                Preferences ->
                    [ "preferences" ]
           )
