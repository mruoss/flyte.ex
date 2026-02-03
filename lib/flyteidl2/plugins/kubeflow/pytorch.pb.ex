defmodule Flyteidl2.Plugins.Kubeflow.ElasticConfig do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.kubeflow.ElasticConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :rdzv_backend, 1, type: :string, json_name: "rdzvBackend"
  field :min_replicas, 2, type: :int32, json_name: "minReplicas"
  field :max_replicas, 3, type: :int32, json_name: "maxReplicas"
  field :nproc_per_node, 4, type: :int32, json_name: "nprocPerNode"
  field :max_restarts, 5, type: :int32, json_name: "maxRestarts"
end

defmodule Flyteidl2.Plugins.Kubeflow.DistributedPyTorchTrainingTask do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.kubeflow.DistributedPyTorchTrainingTask",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :worker_replicas, 1,
    type: Flyteidl2.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec,
    json_name: "workerReplicas"

  field :master_replicas, 2,
    type: Flyteidl2.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec,
    json_name: "masterReplicas"

  field :run_policy, 3, type: Flyteidl2.Plugins.Kubeflow.RunPolicy, json_name: "runPolicy"

  field :elastic_config, 4,
    type: Flyteidl2.Plugins.Kubeflow.ElasticConfig,
    json_name: "elasticConfig"
end

defmodule Flyteidl2.Plugins.Kubeflow.DistributedPyTorchTrainingReplicaSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.kubeflow.DistributedPyTorchTrainingReplicaSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :replicas, 1, type: :int32, deprecated: true
  field :image, 2, type: :string, deprecated: true
  field :resources, 3, type: Flyteidl2.Core.Resources, deprecated: true

  field :restart_policy, 4,
    type: Flyteidl2.Plugins.RestartPolicy,
    json_name: "restartPolicy",
    enum: true,
    deprecated: true

  field :common, 5, type: Flyteidl2.Plugins.CommonReplicaSpec
end
