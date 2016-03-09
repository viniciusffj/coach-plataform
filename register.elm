module Register where

import Html exposing (..)
import Html.Attributes exposing (..)

import Signal exposing (Address)

import StartApp.Simple as StartApp

-- model

type alias Model =
 {
 spots: Int,
 mentor : Bool,
 coach : Bool,
 capabilities : List String,
 description: String
}

model : Model
model =
  {
  spots = 0,
  mentor = False,
  coach = False,
  capabilities = [ ],
  description = ""
 }

-- update
type Action
 = NoOp

update action model =
 case action of
  NoOp -> model

-- view
spots : Html
spots = 
  div [] 
      [ label [ for "spots" ] [ text "Spots:" ],
      input [ id "spots", type' "text", placeholder "Number of possible coachees" ] []]

roles : Html
roles = 
  div [] 
    [ input [ id "mentor", type' "checkbox"] [],
      label [ for "mentor" ] [ text "Mentor" ],
      input [ id "coach", type' "checkbox"] [],
      label [ for "coach" ] [ text "Coach" ]
    ]

capabilities : Html
capabilities =
  div [ ]
      [ label [ for "capabilities" ] [ text "Capabilities" ],
        input [ id "capabilities", type' "text" ] [ ]
      ]

description : Html
description =
  div [ ]
      [ label [ for "description" ] [ text "Description" ],
        textarea [ id "description" ] [ ]
      ]

buttons : Html
buttons =
  div [ ]
      [ button [ id "register" ] [ text "Register" ],
        button [ id "cancel" ] [ text "Cancel" ]
      ]

view : Address Action -> Model -> Html

view address model =
 div [ ] 
     [spots, roles, capabilities, description, buttons]
 


main : Signal Html
main =
 StartApp.start
 {
 model = model,
 view = view,
 update = update
 }