module Coaches.Effects (..) where

import Effects exposing (Effects)
import Http
import Json.Decode as Decode exposing ((:=))
import Task


import Coaches.Models exposing (CoachId, Coach)
import Coaches.Actions exposing (..)


fetchAll : Effects Action
fetchAll =
  Http.get collectionDecoder fetchAllUrl
    |> Task.toResult
    |> Task.map FetchAllDone
    |> Effects.task


fetchAllUrl : String
fetchAllUrl =
  "http://localhost:4000/coaches"



-- DECODERS
collectionDecoder : Decode.Decoder (List Coach)
collectionDecoder =
  Decode.list memberDecoder


memberDecoder : Decode.Decoder Coach
memberDecoder =
  Decode.object7
    Coach
    ("id" := Decode.int)
    ("name" := Decode.string)
    ("spots" := Decode.int)
    ("mentor" := Decode.bool)
    ("coach" := Decode.bool)
    ("capabilities" := Decode.string)
    ("description" := Decode.string)