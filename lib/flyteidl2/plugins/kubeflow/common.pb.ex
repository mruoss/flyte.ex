defmodule Flyteidl2.Plugins.Kubeflow.CleanPodPolicy do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :CLEANPOD_POLICY_NONE, 0
  field :CLEANPOD_POLICY_RUNNING, 1
  field :CLEANPOD_POLICY_ALL, 2
end

defmodule Flyteidl2.Plugins.Kubeflow.RunPolicy do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :clean_pod_policy, 1,
    type: Flyteidl2.Plugins.Kubeflow.CleanPodPolicy,
    json_name: "cleanPodPolicy",
    enum: true

  field :ttl_seconds_after_finished, 2, type: :int32, json_name: "ttlSecondsAfterFinished"
  field :active_deadline_seconds, 3, type: :int32, json_name: "activeDeadlineSeconds"
  field :backoff_limit, 4, type: :int32, json_name: "backoffLimit"
end
