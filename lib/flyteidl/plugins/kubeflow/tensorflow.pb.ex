defmodule Flyteidl.Plugins.Kubeflow.DistributedTensorflowTrainingTask do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :worker_replicas, 1,
    type: Flyteidl.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "workerReplicas"

  field :ps_replicas, 2,
    type: Flyteidl.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "psReplicas"

  field :chief_replicas, 3,
    type: Flyteidl.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "chiefReplicas"

  field :run_policy, 4, type: Flyteidl.Plugins.Kubeflow.RunPolicy, json_name: "runPolicy"
end

defmodule Flyteidl.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec do
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