defmodule Flyteidl2.Plugins.AutoscalerOptions.UpscalingMode do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.plugins.AutoscalerOptions.UpscalingMode",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :UPSCALING_MODE_UNSPECIFIED, 0
  field :UPSCALING_MODE_DEFAULT, 1
  field :UPSCALING_MODE_AGGRESSIVE, 2
  field :UPSCALING_MODE_CONSERVATIVE, 3
end

defmodule Flyteidl2.Plugins.RayJob do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.RayJob",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :ray_cluster, 1, type: Flyteidl2.Plugins.RayCluster, json_name: "rayCluster"
  field :runtime_env, 2, type: :string, json_name: "runtimeEnv", deprecated: true
  field :shutdown_after_job_finishes, 3, type: :bool, json_name: "shutdownAfterJobFinishes"
  field :ttl_seconds_after_finished, 4, type: :int32, json_name: "ttlSecondsAfterFinished"
  field :runtime_env_yaml, 5, type: :string, json_name: "runtimeEnvYaml"
end

defmodule Flyteidl2.Plugins.AutoscalerOptions do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.AutoscalerOptions",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :upscaling_mode, 1,
    type: Flyteidl2.Plugins.AutoscalerOptions.UpscalingMode,
    json_name: "upscalingMode",
    enum: true

  field :idle_timeout_seconds, 2, type: :int32, json_name: "idleTimeoutSeconds"
  field :env, 3, repeated: true, type: Flyteidl2.Core.KeyValuePair
  field :image, 4, type: :string
  field :resources, 5, type: Flyteidl2.Core.Resources
end

defmodule Flyteidl2.Plugins.RayCluster do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.RayCluster",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :head_group_spec, 1, type: Flyteidl2.Plugins.HeadGroupSpec, json_name: "headGroupSpec"

  field :worker_group_spec, 2,
    repeated: true,
    type: Flyteidl2.Plugins.WorkerGroupSpec,
    json_name: "workerGroupSpec"

  field :enable_autoscaling, 3, type: :bool, json_name: "enableAutoscaling"

  field :autoscaler_options, 4,
    type: Flyteidl2.Plugins.AutoscalerOptions,
    json_name: "autoscalerOptions"
end

defmodule Flyteidl2.Plugins.HeadGroupSpec.RayStartParamsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.HeadGroupSpec.RayStartParamsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.HeadGroupSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.HeadGroupSpec",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :ray_start_params, 1,
    repeated: true,
    type: Flyteidl2.Plugins.HeadGroupSpec.RayStartParamsEntry,
    json_name: "rayStartParams",
    map: true

  field :k8s_pod, 2, type: Flyteidl2.Core.K8sPod, json_name: "k8sPod"

  field :extended_resources, 3,
    type: Flyteidl2.Core.ExtendedResources,
    json_name: "extendedResources"
end

defmodule Flyteidl2.Plugins.WorkerGroupSpec.RayStartParamsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.WorkerGroupSpec.RayStartParamsEntry",
    map: true,
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.WorkerGroupSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.plugins.WorkerGroupSpec",
    protoc_gen_elixir_version: "0.17.0",
    syntax: :proto3

  field :group_name, 1, type: :string, json_name: "groupName"
  field :replicas, 2, type: :int32
  field :min_replicas, 3, type: :int32, json_name: "minReplicas"
  field :max_replicas, 4, type: :int32, json_name: "maxReplicas"

  field :ray_start_params, 5,
    repeated: true,
    type: Flyteidl2.Plugins.WorkerGroupSpec.RayStartParamsEntry,
    json_name: "rayStartParams",
    map: true

  field :k8s_pod, 6, type: Flyteidl2.Core.K8sPod, json_name: "k8sPod"

  field :extended_resources, 7,
    type: Flyteidl2.Core.ExtendedResources,
    json_name: "extendedResources"
end
