module View (..) where


import Html exposing (..)

import Actions exposing (..)
import Models exposing (..)


view : Signal.Address Action -> Model -> Html.Html
view address model =
  div [ ]
      [ text "Testing....." ]