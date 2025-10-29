defmodule Flyteidl2.Plugins.TaskExecutionMetadata.LabelsEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.TaskExecutionMetadata.AnnotationsEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.TaskExecutionMetadata.EnvironmentVariablesEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Plugins.TaskExecutionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_execution_id, 1,
    type: Flyteidl2.Core.TaskExecutionIdentifier,
    json_name: "taskExecutionId"

  field :namespace, 2, type: :string

  field :labels, 3,
    repeated: true,
    type: Flyteidl2.Plugins.TaskExecutionMetadata.LabelsEntry,
    map: true

  field :annotations, 4,
    repeated: true,
    type: Flyteidl2.Plugins.TaskExecutionMetadata.AnnotationsEntry,
    map: true

  field :k8s_service_account, 5, type: :string, json_name: "k8sServiceAccount"

  field :environment_variables, 6,
    repeated: true,
    type: Flyteidl2.Plugins.TaskExecutionMetadata.EnvironmentVariablesEntry,
    json_name: "environmentVariables",
    map: true

  field :max_attempts, 7, type: :int32, json_name: "maxAttempts"
  field :interruptible, 8, type: :bool

  field :interruptible_failure_threshold, 9,
    type: :int32,
    json_name: "interruptibleFailureThreshold"

  field :identity, 11, type: Flyteidl2.Core.Identity
end

defmodule Flyteidl2.Plugins.CreateTaskRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :inputs, 1, type: Flyteidl2.Task.Inputs
  field :template, 2, type: Flyteidl2.Core.TaskTemplate
  field :output_prefix, 3, type: :string, json_name: "outputPrefix"

  field :task_execution_metadata, 4,
    type: Flyteidl2.Plugins.TaskExecutionMetadata,
    json_name: "taskExecutionMetadata"

  field :connection, 5, type: Flyteidl2.Core.Connection
end

defmodule Flyteidl2.Plugins.CreateTaskResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_meta, 1, type: :bytes, json_name: "resourceMeta"
end

defmodule Flyteidl2.Plugins.CreateRequestHeader do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :template, 1, type: Flyteidl2.Core.TaskTemplate
  field :output_prefix, 2, type: :string, json_name: "outputPrefix"

  field :task_execution_metadata, 3,
    type: Flyteidl2.Plugins.TaskExecutionMetadata,
    json_name: "taskExecutionMetadata"

  field :max_dataset_size_bytes, 4, type: :int64, json_name: "maxDatasetSizeBytes"
  field :connection, 5, type: Flyteidl2.Core.Connection
end

defmodule Flyteidl2.Plugins.GetTaskRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
  field :task_category, 3, type: Flyteidl2.Plugins.TaskCategory, json_name: "taskCategory"
  field :output_prefix, 4, type: :string, json_name: "outputPrefix"
  field :connection, 5, type: Flyteidl2.Core.Connection
end

defmodule Flyteidl2.Plugins.GetTaskResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource, 1, type: Flyteidl2.Plugins.Resource
end

defmodule Flyteidl2.Plugins.Resource do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :outputs, 2, type: Flyteidl2.Task.Outputs
  field :message, 3, type: :string
  field :log_links, 4, repeated: true, type: Flyteidl2.Core.TaskLog, json_name: "logLinks"
  field :phase, 5, type: Flyteidl2.Core.TaskExecution.Phase, enum: true
  field :custom_info, 6, type: Google.Protobuf.Struct, json_name: "customInfo"
end

defmodule Flyteidl2.Plugins.DeleteTaskRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
  field :task_category, 3, type: Flyteidl2.Plugins.TaskCategory, json_name: "taskCategory"
  field :connection, 5, type: Flyteidl2.Core.Connection
end

defmodule Flyteidl2.Plugins.DeleteTaskResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Plugins.Connector do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string

  field :supported_task_categories, 4,
    repeated: true,
    type: Flyteidl2.Plugins.TaskCategory,
    json_name: "supportedTaskCategories"
end

defmodule Flyteidl2.Plugins.TaskCategory do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :version, 2, type: :int32
end

defmodule Flyteidl2.Plugins.GetConnectorRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Flyteidl2.Plugins.GetConnectorResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :connector, 1, type: Flyteidl2.Plugins.Connector
end

defmodule Flyteidl2.Plugins.ListConnectorsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Plugins.ListConnectorsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :connectors, 1, repeated: true, type: Flyteidl2.Plugins.Connector
end

defmodule Flyteidl2.Plugins.GetTaskMetricsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
  field :queries, 3, repeated: true, type: :string
  field :start_time, 4, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 5, type: Google.Protobuf.Timestamp, json_name: "endTime"
  field :step, 6, type: Google.Protobuf.Duration
  field :task_category, 7, type: Flyteidl2.Plugins.TaskCategory, json_name: "taskCategory"
end

defmodule Flyteidl2.Plugins.GetTaskMetricsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :results, 1, repeated: true, type: Flyteidl2.Core.ExecutionMetricResult
end

defmodule Flyteidl2.Plugins.GetTaskLogsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
  field :lines, 3, type: :uint64
  field :token, 4, type: :string
  field :task_category, 5, type: Flyteidl2.Plugins.TaskCategory, json_name: "taskCategory"
end

defmodule Flyteidl2.Plugins.GetTaskLogsResponseHeader do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :token, 1, type: :string
end

defmodule Flyteidl2.Plugins.GetTaskLogsResponseBody do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :results, 1, repeated: true, type: :string
end

defmodule Flyteidl2.Plugins.GetTaskLogsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :part, 0

  field :header, 1, type: Flyteidl2.Plugins.GetTaskLogsResponseHeader, oneof: 0
  field :body, 2, type: Flyteidl2.Plugins.GetTaskLogsResponseBody, oneof: 0
end
