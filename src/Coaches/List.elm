module Coaches.List (..) where


import Html exposing (..)
import Html.Attributes exposing (class)


import Coaches.Actions exposing (..)
import Coaches.Models exposing (..)


type alias ViewModel =
  {
    coaches : List Coach
  }

view : Signal.Address Action -> ViewModel -> Html.Html
view address model =
  div [ ]
      [
        nav address model,
        list address model
      ]


nav : Signal.Address Action -> ViewModel -> Html.Html
nav address model =
  div [ class "clearfix mb2 white bg-black" ]
      [
        div [ class "left p2" ]
            [ text "Coaches" ]
      ]


list : Signal.Address Action -> ViewModel -> Html.Html
list address model =
  div [ ]
      [
        table [ class "table-light" ]
              [
                thead [ ]
                      [
                        tr  [ ]
                            [
                              th [ ]
                                 [ text "Name" ],
                              th [ ]
                                 [ text "Mentor" ],
                              th [ ]
                                 [ text "Coach" ],
                              th [ ]
                                 [ text "Spots" ]
                ]
            ],
            tbody [ ]
            (List.map (coachRow address model) model.coaches)
        ]
    ]


coachRow : Signal.Address Action -> ViewModel -> Coach -> Html.Html
coachRow address model coach =
  let
    isCoach =
      if coach.coach then
        "X"
      else
        " "

    isMentor =
      if coach.mentor then
        "X"
      else
        " "

  in
    tr  [ ]
        [
          td  [ ]
              [ text coach.name ],
          td  [ ]
              [ text isMentor ],
          td  [ ]
              [ text isCoach ],
          td  [ ]
              [ text (toString coach.spots) ],
          td  [ ]
              [ ]
      ]