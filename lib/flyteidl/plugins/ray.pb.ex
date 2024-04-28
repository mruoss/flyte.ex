defmodule Flyteidl.Plugins.RayJob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ray_cluster, 1, type: Flyteidl.Plugins.RayCluster, json_name: "rayCluster"
  field :runtime_env, 2, type: :string, json_name: "runtimeEnv"
end

defmodule Flyteidl.Plugins.RayCluster do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :head_group_spec, 1, type: Flyteidl.Plugins.HeadGroupSpec, json_name: "headGroupSpec"

  field :worker_group_spec, 2,
    repeated: true,
    type: Flyteidl.Plugins.WorkerGroupSpec,
    json_name: "workerGroupSpec"
end

defmodule Flyteidl.Plugins.HeadGroupSpec.RayStartParamsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Plugins.HeadGroupSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :ray_start_params, 1,
    repeated: true,
    type: Flyteidl.Plugins.HeadGroupSpec.RayStartParamsEntry,
    json_name: "rayStartParams",
    map: true
end

defmodule Flyteidl.Plugins.WorkerGroupSpec.RayStartParamsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Plugins.WorkerGroupSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :group_name, 1, type: :string, json_name: "groupName"
  field :replicas, 2, type: :int32
  field :min_replicas, 3, type: :int32, json_name: "minReplicas"
  field :max_replicas, 4, type: :int32, json_name: "maxReplicas"

  field :ray_start_params, 5,
    repeated: true,
    type: Flyteidl.Plugins.WorkerGroupSpec.RayStartParamsEntry,
    json_name: "rayStartParams",
    map: true
end