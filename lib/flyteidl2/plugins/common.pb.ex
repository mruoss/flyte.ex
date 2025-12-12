defmodule Flyteidl2.Plugins.RestartPolicy do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :RESTART_POLICY_NEVER, 0
  field :RESTART_POLICY_ON_FAILURE, 1
  field :RESTART_POLICY_ALWAYS, 2
end

defmodule Flyteidl2.Plugins.CommonReplicaSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :replicas, 1, type: :int32
  field :image, 2, type: :string
  field :resources, 3, type: Flyteidl2.Core.Resources

  field :restart_policy, 4,
    type: Flyteidl2.Plugins.RestartPolicy,
    json_name: "restartPolicy",
    enum: true
end
