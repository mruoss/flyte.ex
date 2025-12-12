defmodule Flyteidl2.Plugins.DistributedTensorflowTrainingTask do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :workers, 1, type: :int32
  field :ps_replicas, 2, type: :int32, json_name: "psReplicas"
  field :chief_replicas, 3, type: :int32, json_name: "chiefReplicas"
  field :evaluator_replicas, 4, type: :int32, json_name: "evaluatorReplicas"
end
