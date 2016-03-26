module View (..) where


import Html exposing (..)

import Actions exposing (..)
import Models exposing (..)


import Coaches.List exposing (..)


view : Signal.Address Action -> AppModel -> Html.Html
view address model =
  div [ ]
      [
        page address model
      ]


page : Signal.Address Action -> AppModel -> Html.Html
page address model =
  let
    viewModel =
      {
        coaches = model.coaches
      }

  in
    Coaches.List.view (Signal.forwardTo address CoachesAction) viewModel