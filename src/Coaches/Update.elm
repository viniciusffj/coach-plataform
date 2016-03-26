module Coaches.Update (..) where


import Effects exposing (Effects)


import Coaches.Actions exposing (..)
import Coaches.Models exposing (..)


type alias UpdateModel =
  {
    coaches : List Coach
  }


update : Action -> UpdateModel -> (List Coach, Effects Action)
update action model =
  case action of
    NoOp ->
      (model.coaches, Effects.none)