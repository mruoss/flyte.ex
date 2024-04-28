defmodule Flyteidl.Plugins.ElasticConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rdzv_backend, 1, type: :string, json_name: "rdzvBackend"
  field :min_replicas, 2, type: :int32, json_name: "minReplicas"
  field :max_replicas, 3, type: :int32, json_name: "maxReplicas"
  field :nproc_per_node, 4, type: :int32, json_name: "nprocPerNode"
  field :max_restarts, 5, type: :int32, json_name: "maxRestarts"
end

defmodule Flyteidl.Plugins.DistributedPyTorchTrainingTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workers, 1, type: :int32
  field :elastic_config, 2, type: Flyteidl.Plugins.ElasticConfig, json_name: "elasticConfig"
end