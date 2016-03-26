module Coaches.Actions (..) where


import Coaches.Models exposing (CoachId)
import Hop


type Action =
  NoOp
  | HopAction ()
  | EditCoach CoachId
  | ListCoaches