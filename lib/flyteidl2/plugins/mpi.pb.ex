defmodule Flyteidl2.Plugins.DistributedMPITrainingTask do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.DistributedMPITrainingTask",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :num_workers, 1, type: :int32, json_name: "numWorkers"
  field :num_launcher_replicas, 2, type: :int32, json_name: "numLauncherReplicas"
  field :slots, 3, type: :int32
end
