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
    coaches = [ Coach 1 "Sam Newman" 3 True True "Microservices" "Description" ],
    routing = Routing.initialModel
  }