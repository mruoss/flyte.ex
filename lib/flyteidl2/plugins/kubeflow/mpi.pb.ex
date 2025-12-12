defmodule Flyteidl2.Plugins.Kubeflow.DistributedMPITrainingTask do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :worker_replicas, 1,
    type: Flyteidl2.Plugins.Kubeflow.DistributedMPITrainingReplicaSpec,
    json_name: "workerReplicas"

  field :launcher_replicas, 2,
    type: Flyteidl2.Plugins.Kubeflow.DistributedMPITrainingReplicaSpec,
    json_name: "launcherReplicas"

  field :run_policy, 3, type: Flyteidl2.Plugins.Kubeflow.RunPolicy, json_name: "runPolicy"
  field :slots, 4, type: :int32
end

defmodule Flyteidl2.Plugins.Kubeflow.DistributedMPITrainingReplicaSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :replicas, 1, type: :int32, deprecated: true
  field :image, 2, type: :string, deprecated: true
  field :resources, 3, type: Flyteidl2.Core.Resources, deprecated: true

  field :restart_policy, 4,
    type: Flyteidl2.Plugins.RestartPolicy,
    json_name: "restartPolicy",
    enum: true,
    deprecated: true

  field :command, 5, repeated: true, type: :string
  field :common, 6, type: Flyteidl2.Plugins.CommonReplicaSpec
end
