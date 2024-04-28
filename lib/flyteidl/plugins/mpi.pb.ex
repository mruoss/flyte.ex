defmodule Flyteidl.Plugins.DistributedMPITrainingTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :num_workers, 1, type: :int32, json_name: "numWorkers"
  field :num_launcher_replicas, 2, type: :int32, json_name: "numLauncherReplicas"
  field :slots, 3, type: :int32
end