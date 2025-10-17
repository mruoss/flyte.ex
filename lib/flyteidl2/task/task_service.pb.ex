defmodule Flyteidl2.Task.DeployTaskRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :spec, 2, type: Flyteidl2.Task.TaskSpec, deprecated: false
  field :triggers, 3, repeated: true, type: Flyteidl2.Task.TaskTrigger
end

defmodule Flyteidl2.Task.DeployTaskResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Task.GetTaskDetailsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
end

defmodule Flyteidl2.Task.GetTaskDetailsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :details, 1, type: Flyteidl2.Task.TaskDetails
end

defmodule Flyteidl2.Task.ListTasksRequest.KnownFilter do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :filter_by, 0

  field :deployed_by, 1, type: :string, json_name: "deployedBy", oneof: 0
end

defmodule Flyteidl2.Task.ListTasksRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :scope_by, 0

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :project_id, 3, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0

  field :known_filters, 4,
    repeated: true,
    type: Flyteidl2.Task.ListTasksRequest.KnownFilter,
    json_name: "knownFilters"
end

defmodule Flyteidl2.Task.ListTasksResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :tasks, 1, repeated: true, type: Flyteidl2.Task.Task
  field :token, 2, type: :string
end

defmodule Flyteidl2.Task.TaskService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.task.TaskService", protoc_gen_elixir_version: "0.15.0"

  rpc :DeployTask, Flyteidl2.Task.DeployTaskRequest, Flyteidl2.Task.DeployTaskResponse

  rpc :GetTaskDetails, Flyteidl2.Task.GetTaskDetailsRequest, Flyteidl2.Task.GetTaskDetailsResponse

  rpc :ListTasks, Flyteidl2.Task.ListTasksRequest, Flyteidl2.Task.ListTasksResponse
end

defmodule Flyteidl2.Task.TaskService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Task.TaskService.Service
end
