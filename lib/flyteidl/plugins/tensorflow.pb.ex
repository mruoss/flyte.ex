defmodule Flyteidl.Plugins.DistributedTensorflowTrainingTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workers, 1, type: :int32
  field :ps_replicas, 2, type: :int32, json_name: "psReplicas"
  field :chief_replicas, 3, type: :int32, json_name: "chiefReplicas"
end