defmodule Flyteidl2.Task.DeployTaskRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.DeployTaskRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :spec, 2, type: Flyteidl2.Task.TaskSpec, deprecated: false
  field :triggers, 3, repeated: true, type: Flyteidl2.Task.TaskTrigger
end

defmodule Flyteidl2.Task.DeployTaskResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.DeployTaskResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Task.GetTaskDetailsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.GetTaskDetailsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
end

defmodule Flyteidl2.Task.GetTaskDetailsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.GetTaskDetailsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :details, 1, type: Flyteidl2.Task.TaskDetails
end

defmodule Flyteidl2.Task.ListTasksRequest.KnownFilter do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListTasksRequest.KnownFilter",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :filter_by, 0

  field :deployed_by, 1, type: :string, json_name: "deployedBy", oneof: 0
end

defmodule Flyteidl2.Task.ListTasksRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListTasksRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :scope_by, 0

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :project_id, 3, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0

  field :known_filters, 4,
    repeated: true,
    type: Flyteidl2.Task.ListTasksRequest.KnownFilter,
    json_name: "knownFilters"
end

defmodule Flyteidl2.Task.ListTasksResponse.ListTasksMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListTasksResponse.ListTasksMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :total, 1, type: :uint32
  field :filtered_total, 2, type: :uint32, json_name: "filteredTotal"
end

defmodule Flyteidl2.Task.ListTasksResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListTasksResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :tasks, 1, repeated: true, type: Flyteidl2.Task.Task
  field :token, 2, type: :string
  field :metadata, 3, type: Flyteidl2.Task.ListTasksResponse.ListTasksMetadata
end

defmodule Flyteidl2.Task.ListVersionsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListVersionsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :task_name, 2, type: Flyteidl2.Task.TaskName, json_name: "taskName", deprecated: false
end

defmodule Flyteidl2.Task.ListVersionsResponse.VersionResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListVersionsResponse.VersionResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :version, 1, type: :string

  field :deployed_at, 2,
    type: Google.Protobuf.Timestamp,
    json_name: "deployedAt",
    deprecated: false
end

defmodule Flyteidl2.Task.ListVersionsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.ListVersionsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :versions, 1, repeated: true, type: Flyteidl2.Task.ListVersionsResponse.VersionResponse
  field :token, 2, type: :string
end

defmodule Flyteidl2.Task.TaskService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.task.TaskService", protoc_gen_elixir_version: "0.16.0"

  rpc :DeployTask, Flyteidl2.Task.DeployTaskRequest, Flyteidl2.Task.DeployTaskResponse

  rpc :GetTaskDetails, Flyteidl2.Task.GetTaskDetailsRequest, Flyteidl2.Task.GetTaskDetailsResponse

  rpc :ListTasks, Flyteidl2.Task.ListTasksRequest, Flyteidl2.Task.ListTasksResponse

  rpc :ListVersions, Flyteidl2.Task.ListVersionsRequest, Flyteidl2.Task.ListVersionsResponse
end

defmodule Flyteidl2.Task.TaskService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Task.TaskService.Service
end
