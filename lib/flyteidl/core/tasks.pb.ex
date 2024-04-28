defmodule Flyteidl.Core.Resources.ResourceName do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :CPU, 1
  field :GPU, 2
  field :MEMORY, 3
  field :STORAGE, 4
  field :EPHEMERAL_STORAGE, 5
end

defmodule Flyteidl.Core.RuntimeMetadata.RuntimeType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :OTHER, 0
  field :FLYTE_SDK, 1
end

defmodule Flyteidl.Core.Container.Architecture do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNKNOWN, 0
  field :AMD64, 1
  field :ARM64, 2
  field :ARM_V6, 3
  field :ARM_V7, 4
end

defmodule Flyteidl.Core.IOStrategy.DownloadMode do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DOWNLOAD_EAGER, 0
  field :DOWNLOAD_STREAM, 1
  field :DO_NOT_DOWNLOAD, 2
end

defmodule Flyteidl.Core.IOStrategy.UploadMode do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UPLOAD_ON_EXIT, 0
  field :UPLOAD_EAGER, 1
  field :DO_NOT_UPLOAD, 2
end

defmodule Flyteidl.Core.DataLoadingConfig.LiteralMapFormat do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :JSON, 0
  field :YAML, 1
  field :PROTO, 2
end

defmodule Flyteidl.Core.Sql.Dialect do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNDEFINED, 0
  field :ANSI, 1
  field :HIVE, 2
  field :OTHER, 3
end

defmodule Flyteidl.Core.Resources.ResourceEntry do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :name, 1, type: Flyteidl.Core.Resources.ResourceName, enum: true
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.Resources do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :requests, 1, repeated: true, type: Flyteidl.Core.Resources.ResourceEntry
  field :limits, 2, repeated: true, type: Flyteidl.Core.Resources.ResourceEntry
end

defmodule Flyteidl.Core.RuntimeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :type, 1, type: Flyteidl.Core.RuntimeMetadata.RuntimeType, enum: true
  field :version, 2, type: :string
  field :flavor, 3, type: :string
end

defmodule Flyteidl.Core.TaskMetadata.TagsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.TaskMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :interruptible_value, 0

  field :discoverable, 1, type: :bool
  field :runtime, 2, type: Flyteidl.Core.RuntimeMetadata
  field :timeout, 4, type: Google.Protobuf.Duration
  field :retries, 5, type: Flyteidl.Core.RetryStrategy
  field :discovery_version, 6, type: :string, json_name: "discoveryVersion"
  field :deprecated_error_message, 7, type: :string, json_name: "deprecatedErrorMessage"
  field :interruptible, 8, type: :bool, oneof: 0
  field :cache_serializable, 9, type: :bool, json_name: "cacheSerializable"
  field :generates_deck, 10, type: :bool, json_name: "generatesDeck"
  field :tags, 11, repeated: true, type: Flyteidl.Core.TaskMetadata.TagsEntry, map: true
  field :pod_template_name, 12, type: :string, json_name: "podTemplateName"
end

defmodule Flyteidl.Core.TaskTemplate.ConfigEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.TaskTemplate do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :target, 0

  field :id, 1, type: Flyteidl.Core.Identifier
  field :type, 2, type: :string
  field :metadata, 3, type: Flyteidl.Core.TaskMetadata
  field :interface, 4, type: Flyteidl.Core.TypedInterface
  field :custom, 5, type: Google.Protobuf.Struct
  field :container, 6, type: Flyteidl.Core.Container, oneof: 0
  field :k8s_pod, 17, type: Flyteidl.Core.K8sPod, json_name: "k8sPod", oneof: 0
  field :sql, 18, type: Flyteidl.Core.Sql, oneof: 0
  field :task_type_version, 7, type: :int32, json_name: "taskTypeVersion"
  field :security_context, 8, type: Flyteidl.Core.SecurityContext, json_name: "securityContext"
  field :config, 16, repeated: true, type: Flyteidl.Core.TaskTemplate.ConfigEntry, map: true
end

defmodule Flyteidl.Core.ContainerPort do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :container_port, 1, type: :uint32, json_name: "containerPort"
end

defmodule Flyteidl.Core.Container do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :image, 1, type: :string
  field :command, 2, repeated: true, type: :string
  field :args, 3, repeated: true, type: :string
  field :resources, 4, type: Flyteidl.Core.Resources
  field :env, 5, repeated: true, type: Flyteidl.Core.KeyValuePair
  field :config, 6, repeated: true, type: Flyteidl.Core.KeyValuePair, deprecated: true
  field :ports, 7, repeated: true, type: Flyteidl.Core.ContainerPort
  field :data_config, 9, type: Flyteidl.Core.DataLoadingConfig, json_name: "dataConfig"
  field :architecture, 10, type: Flyteidl.Core.Container.Architecture, enum: true
end

defmodule Flyteidl.Core.IOStrategy do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :download_mode, 1,
    type: Flyteidl.Core.IOStrategy.DownloadMode,
    json_name: "downloadMode",
    enum: true

  field :upload_mode, 2,
    type: Flyteidl.Core.IOStrategy.UploadMode,
    json_name: "uploadMode",
    enum: true
end

defmodule Flyteidl.Core.DataLoadingConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :enabled, 1, type: :bool
  field :input_path, 2, type: :string, json_name: "inputPath"
  field :output_path, 3, type: :string, json_name: "outputPath"
  field :format, 4, type: Flyteidl.Core.DataLoadingConfig.LiteralMapFormat, enum: true
  field :io_strategy, 5, type: Flyteidl.Core.IOStrategy, json_name: "ioStrategy"
end

defmodule Flyteidl.Core.K8sPod do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :metadata, 1, type: Flyteidl.Core.K8sObjectMetadata
  field :pod_spec, 2, type: Google.Protobuf.Struct, json_name: "podSpec"
  field :data_config, 3, type: Flyteidl.Core.DataLoadingConfig, json_name: "dataConfig"
end

defmodule Flyteidl.Core.K8sObjectMetadata.LabelsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.K8sObjectMetadata.AnnotationsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.K8sObjectMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :labels, 1, repeated: true, type: Flyteidl.Core.K8sObjectMetadata.LabelsEntry, map: true

  field :annotations, 2,
    repeated: true,
    type: Flyteidl.Core.K8sObjectMetadata.AnnotationsEntry,
    map: true
end

defmodule Flyteidl.Core.Sql do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :statement, 1, type: :string
  field :dialect, 2, type: Flyteidl.Core.Sql.Dialect, enum: true
end