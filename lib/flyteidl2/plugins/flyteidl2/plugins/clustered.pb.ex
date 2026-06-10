defmodule Flyteidl2.Plugins.RdzvBackend do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.plugins.RdzvBackend",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :STATIC, 0
  field :C10D, 1
end

defmodule Flyteidl2.Plugins.Interconnect do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.plugins.Interconnect",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :TCP, 0
  field :EFA, 1
  field :INFINIBAND, 2
  field :ROCE, 3
end

defmodule Flyteidl2.Plugins.ClusteredTaskSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.ClusteredTaskSpec",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :replicas, 1, type: :int32, deprecated: false
  field :nproc_per_node, 2, type: :int32, json_name: "nprocPerNode", deprecated: false
  field :runtime, 3, type: Flyteidl2.Plugins.Runtime
  field :interconnect, 4, type: Flyteidl2.Plugins.Interconnect, enum: true

  field :failure_policy, 5,
    type: Flyteidl2.Plugins.ClusterFailurePolicy,
    json_name: "failurePolicy"

  field :ttl_seconds_after_finished, 6,
    type: Google.Protobuf.UInt32Value,
    json_name: "ttlSecondsAfterFinished"
end

defmodule Flyteidl2.Plugins.Runtime do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.Runtime",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  oneof :kind, 0

  field :torchrun, 1, type: Flyteidl2.Plugins.TorchRuntime, oneof: 0
end

defmodule Flyteidl2.Plugins.TorchRuntime do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.TorchRuntime",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :rdzv_backend, 1,
    type: Flyteidl2.Plugins.RdzvBackend,
    json_name: "rdzvBackend",
    enum: true

  field :max_restarts, 2, type: :int32, json_name: "maxRestarts"
end

defmodule Flyteidl2.Plugins.ClusterFailurePolicy do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.ClusterFailurePolicy",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :max_restarts, 1, type: :int32, json_name: "maxRestarts"
  field :restart_on_host_maintenance, 2, type: :bool, json_name: "restartOnHostMaintenance"
end
