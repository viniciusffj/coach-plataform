module Coaches.Edit (..) where


import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)


import Coaches.Models exposing (..)
import Coaches.Actions exposing (..)


type alias ViewModel =
  {
    coach : Coach
  }


view : Signal.Address Action -> ViewModel -> Html.Html
view address model =
  div []
      [
        nav address model
      ]


nav : Signal.Address Action -> ViewModel -> Html.Html
nav address model =
  div [ class "clearfix mb2 white bg-black p1" ]
      [
        listBtn address model
      ]


listBtn : Signal.Address Action -> ViewModel -> Html.Html
listBtn address model =
  button  [
            class "btn regular",
            onClick address ListCoaches
          ]
          [
            i [ class "fa fa-chevron-left mr1" ]
              [],
            text "List"
          ]