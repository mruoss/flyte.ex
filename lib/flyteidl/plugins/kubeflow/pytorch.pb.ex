defmodule Flyteidl.Plugins.Kubeflow.ElasticConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :rdzv_backend, 1, type: :string, json_name: "rdzvBackend"
  field :min_replicas, 2, type: :int32, json_name: "minReplicas"
  field :max_replicas, 3, type: :int32, json_name: "maxReplicas"
  field :nproc_per_node, 4, type: :int32, json_name: "nprocPerNode"
  field :max_restarts, 5, type: :int32, json_name: "maxRestarts"
end

defmodule Flyteidl.Plugins.Kubeflow.DistributedPyTorchTrainingTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :worker_replicas, 1,
    type: Flyteidl.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec,
    json_name: "workerReplicas"

  field :master_replicas, 2,
    type: Flyteidl.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec,
    json_name: "masterReplicas"

  field :run_policy, 3, type: Flyteidl.Plugins.Kubeflow.RunPolicy, json_name: "runPolicy"

  field :elastic_config, 4,
    type: Flyteidl.Plugins.Kubeflow.ElasticConfig,
    json_name: "elasticConfig"
end

defmodule Flyteidl.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :replicas, 1, type: :int32
  field :image, 2, type: :string
  field :resources, 3, type: Flyteidl.Core.Resources

  field :restart_policy, 4,
    type: Flyteidl.Plugins.Kubeflow.RestartPolicy,
    json_name: "restartPolicy",
    enum: true
end