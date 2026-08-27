defmodule Flyteidl2.Workflow.CreateTrackedRunRequest.LabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.CreateTrackedRunRequest.LabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Workflow.CreateTrackedRunRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.CreateTrackedRunRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :id, 0

  oneof :task, 1

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", oneof: 0
  field :project_id, 2, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 3, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 1
  field :task_spec, 4, type: Flyteidl2.Task.TaskSpec, json_name: "taskSpec", oneof: 1

  field :offloaded_input_data, 5,
    proto3_optional: true,
    type: Flyteidl2.Common.OffloadedInputData,
    json_name: "offloadedInputData"

  field :run_spec, 6, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"

  field :labels, 7,
    repeated: true,
    type: Flyteidl2.Workflow.CreateTrackedRunRequest.LabelsEntry,
    map: true

  field :run_start_time, 8, type: Google.Protobuf.Timestamp, json_name: "runStartTime"
end

defmodule Flyteidl2.Workflow.TrackedActionUpdate do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.TrackedActionUpdate",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :spec, 0

  field :event, 1, type: Flyteidl2.Workflow.ActionEvent, deprecated: false
  field :parent_name, 2, type: :string, json_name: "parentName"
  field :group, 3, type: :string
  field :task, 4, type: Flyteidl2.Workflow.TaskAction, oneof: 0
  field :trace, 5, type: Flyteidl2.Workflow.TraceAction, oneof: 0
  field :status, 6, type: Flyteidl2.Workflow.ActionStatus
end

defmodule Flyteidl2.Workflow.ReportTrackedActionsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.ReportTrackedActionsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false

  field :updates, 2,
    repeated: true,
    type: Flyteidl2.Workflow.TrackedActionUpdate,
    deprecated: false
end

defmodule Flyteidl2.Workflow.ReportTrackedActionsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.ReportTrackedActionsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :statuses, 1, repeated: true, type: Google.Rpc.Status
end

defmodule Flyteidl2.Workflow.TrackedRunService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.workflow.TrackedRunService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :CreateRun, Flyteidl2.Workflow.CreateTrackedRunRequest, Flyteidl2.Workflow.CreateRunResponse

  rpc :ReportActions,
      Flyteidl2.Workflow.ReportTrackedActionsRequest,
      Flyteidl2.Workflow.ReportTrackedActionsResponse

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

  rpc :ListRuns, Flyteidl2.Workflow.ListRunsRequest, Flyteidl2.Workflow.ListRunsResponse

  rpc :WatchRuns,
      Flyteidl2.Workflow.WatchRunsRequest,
      stream(Flyteidl2.Workflow.WatchRunsResponse)

  rpc :ListActions, Flyteidl2.Workflow.ListActionsRequest, Flyteidl2.Workflow.ListActionsResponse

  rpc :WatchActions,
      Flyteidl2.Workflow.WatchActionsRequest,
      stream(Flyteidl2.Workflow.WatchActionsResponse)

  rpc :AbortRun, Flyteidl2.Workflow.AbortRunRequest, Flyteidl2.Workflow.AbortRunResponse
end

defmodule Flyteidl2.Workflow.TrackedRunService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.TrackedRunService.Service
end
