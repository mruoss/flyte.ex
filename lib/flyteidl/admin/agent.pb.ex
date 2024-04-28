defmodule Flyteidl.Admin.State do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :RETRYABLE_FAILURE, 0
  field :PERMANENT_FAILURE, 1
  field :PENDING, 2
  field :RUNNING, 3
  field :SUCCEEDED, 4
end

defmodule Flyteidl.Admin.TaskExecutionMetadata.LabelsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.TaskExecutionMetadata.AnnotationsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.TaskExecutionMetadata.EnvironmentVariablesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.TaskExecutionMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_execution_id, 1,
    type: Flyteidl.Core.TaskExecutionIdentifier,
    json_name: "taskExecutionId"

  field :namespace, 2, type: :string

  field :labels, 3,
    repeated: true,
    type: Flyteidl.Admin.TaskExecutionMetadata.LabelsEntry,
    map: true

  field :annotations, 4,
    repeated: true,
    type: Flyteidl.Admin.TaskExecutionMetadata.AnnotationsEntry,
    map: true

  field :k8s_service_account, 5, type: :string, json_name: "k8sServiceAccount"

  field :environment_variables, 6,
    repeated: true,
    type: Flyteidl.Admin.TaskExecutionMetadata.EnvironmentVariablesEntry,
    json_name: "environmentVariables",
    map: true
end

defmodule Flyteidl.Admin.CreateTaskRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: Flyteidl.Core.LiteralMap
  field :template, 2, type: Flyteidl.Core.TaskTemplate
  field :output_prefix, 3, type: :string, json_name: "outputPrefix"

  field :task_execution_metadata, 4,
    type: Flyteidl.Admin.TaskExecutionMetadata,
    json_name: "taskExecutionMetadata"
end

defmodule Flyteidl.Admin.CreateTaskResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_meta, 1, type: :bytes, json_name: "resourceMeta"
end

defmodule Flyteidl.Admin.GetTaskRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_type, 1, type: :string, json_name: "taskType"
  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
end

defmodule Flyteidl.Admin.GetTaskResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource, 1, type: Flyteidl.Admin.Resource
end

defmodule Flyteidl.Admin.Resource do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :state, 1, type: Flyteidl.Admin.State, enum: true
  field :outputs, 2, type: Flyteidl.Core.LiteralMap
end

defmodule Flyteidl.Admin.DeleteTaskRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_type, 1, type: :string, json_name: "taskType"
  field :resource_meta, 2, type: :bytes, json_name: "resourceMeta"
end

defmodule Flyteidl.Admin.DeleteTaskResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end