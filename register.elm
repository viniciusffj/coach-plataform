module Register where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, on, targetValue, targetChecked)

import Signal exposing (Address)

import String

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
type Action =
  NoOp
  | UpdateSpots String
  | UpdateMentor Bool
  | UpdateCoach Bool
  | UpdateCapabilities String
  | UpdateDescription String
  | Register
  | Cancel

update : Action -> Model -> Model
update action model =
 case action of
  NoOp -> model

  UpdateSpots content ->
    { model | spots = String.toInt content |> Result.toMaybe |> Maybe.withDefault 0 }

  UpdateMentor content ->
    { model | mentor = content  }

  UpdateCoach content ->
    { model | coach = content  }

  UpdateCapabilities content ->
    { model | capabilities = String.words content  }

  UpdateDescription content ->
    { model | description = content  }

  Register ->
    {
      model |
      spots = 0,
      mentor = False,
      coach = False,
      capabilities = [],
      description = ""
    }

  Cancel ->
    {
      model |
      spots = 0,
      mentor = False,
      coach = False,
      capabilities = [],
      description = ""
    }


-- view
spots : Address Action -> Model -> Html
spots address model = 
  div [] 
      [ label [ for "spots" ] [ text "Spots:" ],
        input
          [
            id "spots",
            type' "text",
            placeholder "Number of possible coachees",
            value (toString model.spots),
            on "input" targetValue (Signal.message address << UpdateSpots)
          ]
          [ ]
      ]

roles : Address Action -> Model -> Html
roles address model = 
  div [] 
    [ input
        [
          id "mentor",
          type' "checkbox",
          checked model.mentor,
          on "change" targetChecked (Signal.message address << UpdateMentor)
        ] [],
      label [ for "mentor" ] [ text "Mentor" ],
      input
        [
          id "coach",
          type' "checkbox",
          checked model.coach,
          on "change" targetChecked (Signal.message address << UpdateCoach)
        ] [],
      label [ for "coach" ] [ text "Coach" ]
    ]

capabilities : Address Action -> Model -> Html
capabilities address model =
  let
    capabilitiesToString = String.join " " model.capabilities
  in
    div [ ]
        [ label [ for "capabilities" ] [ text "Capabilities" ],
          input
          [
            id "capabilities",
            type' "text",
            value capabilitiesToString,
            on "input" targetValue (Signal.message address << UpdateCapabilities)
          ] [ ]
        ]

description : Address Action -> Model -> Html
description address model =
  div [ ]
      [ label [ for "description" ] [ text "Description" ],
        textarea
          [
            id "description",
            value model.description,
            on "input" targetValue (Signal.message address << UpdateDescription)
          ] [ ]
      ]

buttons : Address Action -> Model -> Html
buttons address model =
  div [ ]
      [ button [ id "register", onClick address Register ] [ text "Register" ],
        button [ id "cancel", onClick address Cancel ] [ text "Cancel" ]
      ]

view : Address Action -> Model -> Html

view address model =
 div [ ] 
     [
      spots address model,
      roles address model,
      capabilities address model,
      description address model,
      buttons address model
     ]
 


main : Signal Html
main =
 StartApp.start
 {
 model = model,
 view = view,
 update = update
 }