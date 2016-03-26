module Models (..) where


import Coaches.Models exposing (Coach)


type alias AppModel =
  {
    coaches : List Coach
  }


initialModel : AppModel
initialModel =
  {
    coaches = [ ]
  }