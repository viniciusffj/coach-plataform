module Coaches.List (..) where


import Html exposing (..)


import Coaches.Actions exposing (..)
import Coaches.Models exposing (..)


type alias ViewModel =
  {
    coaches : List Coach
  }

view : Signal.Address Action -> ViewModel -> Html.Html
view address model =
  div [ ]
      [ text "List of Coaches" ]