module Actions (..) where


import Coaches.Actions exposing (..)

type Action =
  NoOp
  | CoachesAction Coaches.Actions.Action