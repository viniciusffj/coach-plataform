module Models (..) where


import Coaches.Models exposing (Coach)


import Routing


type alias AppModel =
  {
    coaches : List Coach,
    routing : Routing.Model
  }


initialModel : AppModel
initialModel =
  {
    coaches = [ ],
    routing = Routing.initialModel
  }