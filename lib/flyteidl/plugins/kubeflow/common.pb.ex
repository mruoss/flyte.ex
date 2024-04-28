defmodule Flyteidl.Plugins.Kubeflow.RestartPolicy do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :RESTART_POLICY_NEVER, 0
  field :RESTART_POLICY_ON_FAILURE, 1
  field :RESTART_POLICY_ALWAYS, 2
end

defmodule Flyteidl.Plugins.Kubeflow.CleanPodPolicy do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :CLEANPOD_POLICY_NONE, 0
  field :CLEANPOD_POLICY_RUNNING, 1
  field :CLEANPOD_POLICY_ALL, 2
end

defmodule Flyteidl.Plugins.Kubeflow.RunPolicy do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :clean_pod_policy, 1,
    type: Flyteidl.Plugins.Kubeflow.CleanPodPolicy,
    json_name: "cleanPodPolicy",
    enum: true

  field :ttl_seconds_after_finished, 2, type: :int32, json_name: "ttlSecondsAfterFinished"
  field :active_deadline_seconds, 3, type: :int32, json_name: "activeDeadlineSeconds"
  field :backoff_limit, 4, type: :int32, json_name: "backoffLimit"
end