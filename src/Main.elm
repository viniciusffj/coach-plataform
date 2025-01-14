module Main (..) where


import Html exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp


import Actions exposing (..)
import Models exposing (..)
import Update exposing (..)
import View exposing (..)


import Routing


import Coaches.Effects


-- START APP
init : (AppModel, Effects Action)
init =
  let
    fxs =
      [
        Effects.map CoachesAction Coaches.Effects.fetchAll
      ]

    fx =
      Effects.batch fxs

  in
    (Models.initialModel, fx)


routerSignal : Signal Action
routerSignal =
  Signal.map RoutingAction Routing.signal


app : StartApp.App AppModel
app =
  StartApp.start
  {
    init = init,
    inputs = [ routerSignal ],
    update = update,
    view = view
  }


-- MAIN
main : Signal.Signal Html
main =
  app.html


-- PORT
port runner : Signal (Task.Task Never ())
port runner =
  app.tasks


port routeRunTask : Task.Task () ()
port routeRunTask =
  Routing.run