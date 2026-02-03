defmodule Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingTask do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.kubeflow.DistributedTensorflowTrainingTask",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :worker_replicas, 1,
    type: Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "workerReplicas"

  field :ps_replicas, 2,
    type: Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "psReplicas"

  field :chief_replicas, 3,
    type: Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "chiefReplicas"

  field :run_policy, 4, type: Flyteidl2.Plugins.Kubeflow.RunPolicy, json_name: "runPolicy"

  field :evaluator_replicas, 5,
    type: Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec,
    json_name: "evaluatorReplicas"
end

defmodule Flyteidl2.Plugins.Kubeflow.DistributedTensorflowTrainingReplicaSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.kubeflow.DistributedTensorflowTrainingReplicaSpec",
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
