module Coaches.Update (..) where


import Effects exposing (Effects)


import Coaches.Actions exposing (..)
import Coaches.Models exposing (..)


import Hop.Navigate exposing (navigateTo)


type alias UpdateModel =
  {
    coaches : List Coach
  }


update : Action -> UpdateModel -> (List Coach, Effects Action)
update action model =
  case action of
    NoOp ->
      (model.coaches, Effects.none)

    EditCoach id ->
      let
        path =
          "/coaches/" ++ (toString id) ++ "/edit"

      in
        (model.coaches, Effects.map HopAction (navigateTo path))

    ListCoaches ->
      let
        path =
          "/coaches"

      in
        (model.coaches, Effects.map HopAction (navigateTo path))

    HopAction _ ->
      (model.coaches, Effects.none)

    FetchAllDone result ->
      case result of
        Ok coaches ->
          (coaches, Effects.none)

        Err error ->
          (model.coaches, Effects.none)