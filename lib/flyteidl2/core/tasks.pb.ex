defmodule Flyteidl2.Core.Resources.ResourceName do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.Resources.ResourceName",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :CPU, 1
  field :GPU, 2
  field :MEMORY, 3
  field :STORAGE, 4
  field :EPHEMERAL_STORAGE, 5
end

defmodule Flyteidl2.Core.GPUAccelerator.DeviceClass do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.GPUAccelerator.DeviceClass",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :NVIDIA_GPU, 0
  field :GOOGLE_TPU, 1
  field :AMAZON_NEURON, 2
  field :AMD_GPU, 3
  field :HABANA_GAUDI, 4
end

defmodule Flyteidl2.Core.RuntimeMetadata.RuntimeType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.RuntimeMetadata.RuntimeType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :OTHER, 0
  field :FLYTE_SDK, 1
end

defmodule Flyteidl2.Core.Container.Architecture do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.Container.Architecture",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNKNOWN, 0
  field :AMD64, 1
  field :ARM64, 2
  field :ARM_V6, 3
  field :ARM_V7, 4
end

defmodule Flyteidl2.Core.IOStrategy.DownloadMode do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.IOStrategy.DownloadMode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :DOWNLOAD_EAGER, 0
  field :DOWNLOAD_STREAM, 1
  field :DO_NOT_DOWNLOAD, 2
end

defmodule Flyteidl2.Core.IOStrategy.UploadMode do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.IOStrategy.UploadMode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UPLOAD_ON_EXIT, 0
  field :UPLOAD_EAGER, 1
  field :DO_NOT_UPLOAD, 2
end

defmodule Flyteidl2.Core.DataLoadingConfig.LiteralMapFormat do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.DataLoadingConfig.LiteralMapFormat",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :JSON, 0
  field :YAML, 1
  field :PROTO, 2
end

defmodule Flyteidl2.Core.Sql.Dialect do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.core.Sql.Dialect",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :UNDEFINED, 0
  field :ANSI, 1
  field :HIVE, 2
  field :OTHER, 3
end

defmodule Flyteidl2.Core.Resources.ResourceEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Resources.ResourceEntry",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: Flyteidl2.Core.Resources.ResourceName, enum: true
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.Resources do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Resources",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :requests, 1, repeated: true, type: Flyteidl2.Core.Resources.ResourceEntry
  field :limits, 2, repeated: true, type: Flyteidl2.Core.Resources.ResourceEntry
end

defmodule Flyteidl2.Core.GPUAccelerator do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.GPUAccelerator",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :partition_size_value, 0

  field :device, 1, type: :string
  field :unpartitioned, 2, type: :bool, oneof: 0
  field :partition_size, 3, type: :string, json_name: "partitionSize", oneof: 0

  field :device_class, 4,
    type: Flyteidl2.Core.GPUAccelerator.DeviceClass,
    json_name: "deviceClass",
    enum: true
end

defmodule Flyteidl2.Core.SharedMemory do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.SharedMemory",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :mount_path, 1, type: :string, json_name: "mountPath"
  field :mount_name, 2, type: :string, json_name: "mountName"
  field :size_limit, 3, type: :string, json_name: "sizeLimit"
end

defmodule Flyteidl2.Core.ExtendedResources do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ExtendedResources",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :gpu_accelerator, 1, type: Flyteidl2.Core.GPUAccelerator, json_name: "gpuAccelerator"
  field :shared_memory, 2, type: Flyteidl2.Core.SharedMemory, json_name: "sharedMemory"
end

defmodule Flyteidl2.Core.RuntimeMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.RuntimeMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :type, 1, type: Flyteidl2.Core.RuntimeMetadata.RuntimeType, enum: true
  field :version, 2, type: :string
  field :flavor, 3, type: :string
end

defmodule Flyteidl2.Core.TaskMetadata.TagsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskMetadata.TagsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.TaskMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :interruptible_value, 0

  field :discoverable, 1, type: :bool
  field :runtime, 2, type: Flyteidl2.Core.RuntimeMetadata
  field :timeout, 4, type: Google.Protobuf.Duration
  field :retries, 5, type: Flyteidl2.Core.RetryStrategy
  field :discovery_version, 6, type: :string, json_name: "discoveryVersion"
  field :deprecated_error_message, 7, type: :string, json_name: "deprecatedErrorMessage"
  field :interruptible, 8, type: :bool, oneof: 0
  field :cache_serializable, 9, type: :bool, json_name: "cacheSerializable"
  field :tags, 11, repeated: true, type: Flyteidl2.Core.TaskMetadata.TagsEntry, map: true
  field :pod_template_name, 12, type: :string, json_name: "podTemplateName"

  field :cache_ignore_input_vars, 13,
    repeated: true,
    type: :string,
    json_name: "cacheIgnoreInputVars"

  field :is_eager, 14, type: :bool, json_name: "isEager"
  field :generates_deck, 15, type: Google.Protobuf.BoolValue, json_name: "generatesDeck"
  field :metadata, 16, type: Flyteidl2.Core.K8sObjectMetadata
  field :debuggable, 17, type: :bool
  field :log_links, 18, repeated: true, type: Flyteidl2.Core.TaskLog, json_name: "logLinks"
end

defmodule Flyteidl2.Core.TaskTemplate.ConfigEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskTemplate.ConfigEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.TaskTemplate do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.TaskTemplate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :target, 0

  field :id, 1, type: Flyteidl2.Core.Identifier
  field :type, 2, type: :string
  field :metadata, 3, type: Flyteidl2.Core.TaskMetadata
  field :interface, 4, type: Flyteidl2.Core.TypedInterface
  field :custom, 5, type: Google.Protobuf.Struct
  field :container, 6, type: Flyteidl2.Core.Container, oneof: 0
  field :k8s_pod, 17, type: Flyteidl2.Core.K8sPod, json_name: "k8sPod", oneof: 0
  field :sql, 18, type: Flyteidl2.Core.Sql, oneof: 0
  field :task_type_version, 7, type: :int32, json_name: "taskTypeVersion"
  field :security_context, 8, type: Flyteidl2.Core.SecurityContext, json_name: "securityContext"

  field :extended_resources, 9,
    type: Flyteidl2.Core.ExtendedResources,
    json_name: "extendedResources"

  field :config, 16, repeated: true, type: Flyteidl2.Core.TaskTemplate.ConfigEntry, map: true
end

defmodule Flyteidl2.Core.ContainerPort do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.ContainerPort",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :container_port, 1, type: :uint32, json_name: "containerPort"
  field :name, 2, type: :string
end

defmodule Flyteidl2.Core.Container do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Container",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :image, 1, type: :string
  field :command, 2, repeated: true, type: :string
  field :args, 3, repeated: true, type: :string
  field :resources, 4, type: Flyteidl2.Core.Resources
  field :env, 5, repeated: true, type: Flyteidl2.Core.KeyValuePair
  field :config, 6, repeated: true, type: Flyteidl2.Core.KeyValuePair, deprecated: true
  field :ports, 7, repeated: true, type: Flyteidl2.Core.ContainerPort
  field :data_config, 9, type: Flyteidl2.Core.DataLoadingConfig, json_name: "dataConfig"
  field :architecture, 10, type: Flyteidl2.Core.Container.Architecture, enum: true
end

defmodule Flyteidl2.Core.IOStrategy do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.IOStrategy",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :download_mode, 1,
    type: Flyteidl2.Core.IOStrategy.DownloadMode,
    json_name: "downloadMode",
    enum: true

  field :upload_mode, 2,
    type: Flyteidl2.Core.IOStrategy.UploadMode,
    json_name: "uploadMode",
    enum: true
end

defmodule Flyteidl2.Core.DataLoadingConfig do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.DataLoadingConfig",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :enabled, 1, type: :bool
  field :input_path, 2, type: :string, json_name: "inputPath"
  field :output_path, 3, type: :string, json_name: "outputPath"
  field :format, 4, type: Flyteidl2.Core.DataLoadingConfig.LiteralMapFormat, enum: true
  field :io_strategy, 5, type: Flyteidl2.Core.IOStrategy, json_name: "ioStrategy"
end

defmodule Flyteidl2.Core.K8sPod do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.K8sPod",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :metadata, 1, type: Flyteidl2.Core.K8sObjectMetadata
  field :pod_spec, 2, type: Google.Protobuf.Struct, json_name: "podSpec"
  field :data_config, 3, type: Flyteidl2.Core.DataLoadingConfig, json_name: "dataConfig"
  field :primary_container_name, 4, type: :string, json_name: "primaryContainerName"
end

defmodule Flyteidl2.Core.K8sObjectMetadata.LabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.K8sObjectMetadata.LabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.K8sObjectMetadata.AnnotationsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.K8sObjectMetadata.AnnotationsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Core.K8sObjectMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.K8sObjectMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :labels, 1, repeated: true, type: Flyteidl2.Core.K8sObjectMetadata.LabelsEntry, map: true

  field :annotations, 2,
    repeated: true,
    type: Flyteidl2.Core.K8sObjectMetadata.AnnotationsEntry,
    map: true
end

defmodule Flyteidl2.Core.Sql do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.core.Sql",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :statement, 1, type: :string
  field :dialect, 2, type: Flyteidl2.Core.Sql.Dialect, enum: true
end
