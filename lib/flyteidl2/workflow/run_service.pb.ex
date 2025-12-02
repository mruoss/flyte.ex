defmodule Flyteidl2.Workflow.CreateRunRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :id, 0

  oneof :task, 1

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", oneof: 0
  field :project_id, 6, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 2, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 1
  field :task_spec, 3, type: Flyteidl2.Task.TaskSpec, json_name: "taskSpec", oneof: 1
  field :trigger_name, 7, type: Flyteidl2.Common.TriggerName, json_name: "triggerName", oneof: 1
  field :inputs, 4, type: Flyteidl2.Task.Inputs
  field :run_spec, 5, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :source, 8, type: Flyteidl2.Workflow.RunSource, enum: true
end

defmodule Flyteidl2.Workflow.CreateRunResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run, 1, type: Flyteidl2.Workflow.Run
end

defmodule Flyteidl2.Workflow.AbortRunRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
  field :reason, 2, proto3_optional: true, type: :string
end

defmodule Flyteidl2.Workflow.AbortRunResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Workflow.GetRunDetailsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
end

defmodule Flyteidl2.Workflow.GetRunDetailsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :details, 1, type: Flyteidl2.Workflow.RunDetails
end

defmodule Flyteidl2.Workflow.WatchRunDetailsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
end

defmodule Flyteidl2.Workflow.WatchRunDetailsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :details, 1, type: Flyteidl2.Workflow.RunDetails
end

defmodule Flyteidl2.Workflow.GetActionDetailsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false
end

defmodule Flyteidl2.Workflow.GetActionDetailsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :details, 1, type: Flyteidl2.Workflow.ActionDetails
end

defmodule Flyteidl2.Workflow.WatchActionDetailsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false
end

defmodule Flyteidl2.Workflow.WatchActionDetailsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :details, 1, type: Flyteidl2.Workflow.ActionDetails
end

defmodule Flyteidl2.Workflow.GetActionDataRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false
end

defmodule Flyteidl2.Workflow.GetActionDataResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :inputs, 1, type: Flyteidl2.Task.Inputs
  field :outputs, 2, type: Flyteidl2.Task.Outputs
end

defmodule Flyteidl2.Workflow.ListRunsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :scope_by, 0

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :project_id, 4, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :trigger_name, 6, type: Flyteidl2.Common.TriggerName, json_name: "triggerName", oneof: 0
end

defmodule Flyteidl2.Workflow.ListRunsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :runs, 1, repeated: true, type: Flyteidl2.Workflow.Run
  field :token, 2, type: :string
end

defmodule Flyteidl2.Workflow.WatchRunsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :target, 0

  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :cluster_id, 3, type: Flyteidl2.Common.ClusterIdentifier, json_name: "clusterId", oneof: 0
  field :project_id, 4, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 5, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 0
end

defmodule Flyteidl2.Workflow.WatchRunsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :runs, 1, repeated: true, type: Flyteidl2.Workflow.Run
end

defmodule Flyteidl2.Workflow.ListActionsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :run_id, 2, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
end

defmodule Flyteidl2.Workflow.ListActionsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :actions, 1, repeated: true, type: Flyteidl2.Workflow.Action
  field :token, 2, type: :string
end

defmodule Flyteidl2.Workflow.WatchActionsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
  field :filter, 2, repeated: true, type: Flyteidl2.Common.Filter
end

defmodule Flyteidl2.Workflow.WatchActionsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :enriched_actions, 1,
    repeated: true,
    type: Flyteidl2.Workflow.EnrichedAction,
    json_name: "enrichedActions"
end

defmodule Flyteidl2.Workflow.WatchClusterEventsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.ActionIdentifier, deprecated: false
  field :attempt, 2, type: :uint32, deprecated: false
end

defmodule Flyteidl2.Workflow.WatchClusterEventsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :cluster_events, 1,
    repeated: true,
    type: Flyteidl2.Workflow.ClusterEvent,
    json_name: "clusterEvents"
end

defmodule Flyteidl2.Workflow.AbortActionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :reason, 2, type: :string
end

defmodule Flyteidl2.Workflow.AbortActionResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Workflow.WatchGroupsRequest.KnownSortField do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :sort_by, 0

  field :created_at, 1,
    type: Flyteidl2.Common.Sort.Direction,
    json_name: "createdAt",
    enum: true,
    oneof: 0
end

defmodule Flyteidl2.Workflow.WatchGroupsRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :scope_by, 0

  field :project_id, 1, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :start_date, 2, type: Google.Protobuf.Timestamp, json_name: "startDate", deprecated: false
  field :end_date, 3, type: Google.Protobuf.Timestamp, json_name: "endDate"
  field :request, 4, type: Flyteidl2.Common.ListRequest

  field :known_sort_fields, 5,
    repeated: true,
    type: Flyteidl2.Workflow.WatchGroupsRequest.KnownSortField,
    json_name: "knownSortFields"
end

defmodule Flyteidl2.Workflow.WatchGroupsResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_groups, 1,
    repeated: true,
    type: Flyteidl2.Workflow.TaskGroup,
    json_name: "taskGroups"

  field :sentinel, 2, type: :bool
end

defmodule Flyteidl2.Workflow.RunService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.workflow.RunService", protoc_gen_elixir_version: "0.15.0"

  rpc :CreateRun, Flyteidl2.Workflow.CreateRunRequest, Flyteidl2.Workflow.CreateRunResponse

  rpc :AbortRun, Flyteidl2.Workflow.AbortRunRequest, Flyteidl2.Workflow.AbortRunResponse

  rpc :GetRunDetails,
      Flyteidl2.Workflow.GetRunDetailsRequest,
      Flyteidl2.Workflow.GetRunDetailsResponse

  rpc :WatchRunDetails,
      Flyteidl2.Workflow.WatchRunDetailsRequest,
      stream(Flyteidl2.Workflow.WatchRunDetailsResponse)

  rpc :GetActionDetails,
      Flyteidl2.Workflow.GetActionDetailsRequest,
      Flyteidl2.Workflow.GetActionDetailsResponse

  rpc :WatchActionDetails,
      Flyteidl2.Workflow.WatchActionDetailsRequest,
      stream(Flyteidl2.Workflow.WatchActionDetailsResponse)

  rpc :GetActionData,
      Flyteidl2.Workflow.GetActionDataRequest,
      Flyteidl2.Workflow.GetActionDataResponse

  rpc :ListRuns, Flyteidl2.Workflow.ListRunsRequest, Flyteidl2.Workflow.ListRunsResponse

  rpc :WatchRuns,
      Flyteidl2.Workflow.WatchRunsRequest,
      stream(Flyteidl2.Workflow.WatchRunsResponse)

  rpc :ListActions, Flyteidl2.Workflow.ListActionsRequest, Flyteidl2.Workflow.ListActionsResponse

  rpc :WatchActions,
      Flyteidl2.Workflow.WatchActionsRequest,
      stream(Flyteidl2.Workflow.WatchActionsResponse)

  rpc :WatchClusterEvents,
      Flyteidl2.Workflow.WatchClusterEventsRequest,
      stream(Flyteidl2.Workflow.WatchClusterEventsResponse)

  rpc :AbortAction, Flyteidl2.Workflow.AbortActionRequest, Flyteidl2.Workflow.AbortActionResponse

  rpc :WatchGroups,
      Flyteidl2.Workflow.WatchGroupsRequest,
      stream(Flyteidl2.Workflow.WatchGroupsResponse)
end

defmodule Flyteidl2.Workflow.RunService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.RunService.Service
end
