defmodule Flyteidl2.Plugins.ElasticConfig do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.ElasticConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :rdzv_backend, 1, type: :string, json_name: "rdzvBackend"
  field :min_replicas, 2, type: :int32, json_name: "minReplicas"
  field :max_replicas, 3, type: :int32, json_name: "maxReplicas"
  field :nproc_per_node, 4, type: :int32, json_name: "nprocPerNode"
  field :max_restarts, 5, type: :int32, json_name: "maxRestarts"
end

defmodule Flyteidl2.Plugins.DistributedPyTorchTrainingTask do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.DistributedPyTorchTrainingTask",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :workers, 1, type: :int32
  field :elastic_config, 2, type: Flyteidl2.Plugins.ElasticConfig, json_name: "elasticConfig"
end
