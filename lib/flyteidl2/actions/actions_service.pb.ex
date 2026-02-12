defmodule Flyteidl2.Actions.EnqueueRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.EnqueueRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :spec, 0

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :parent_action_name, 2,
    proto3_optional: true,
    type: :string,
    json_name: "parentActionName"

  field :run_spec, 3, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :input_uri, 6, type: :string, json_name: "inputUri", deprecated: false
  field :run_output_base, 7, type: :string, json_name: "runOutputBase", deprecated: false
  field :group, 8, type: :string
  field :subject, 9, type: :string
  field :task, 10, type: Flyteidl2.Workflow.TaskAction, oneof: 0
  field :trace, 11, type: Flyteidl2.Workflow.TraceAction, oneof: 0
  field :condition, 12, type: Flyteidl2.Workflow.ConditionAction, oneof: 0
end

defmodule Flyteidl2.Actions.EnqueueResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.EnqueueResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Actions.UpdateRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.UpdateRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :attempt, 2, type: :uint32, deprecated: false
  field :status, 3, type: Flyteidl2.Workflow.ActionStatus, deprecated: false
  field :state, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.Actions.UpdateResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.UpdateResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Actions.GetLatestStateRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.GetLatestStateRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :attempt, 2, type: :uint32, deprecated: false
end

defmodule Flyteidl2.Actions.GetLatestStateResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.GetLatestStateResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :state, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Actions.WatchForUpdatesRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.WatchForUpdatesRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :filter, 0

  field :parent_action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "parentActionId",
    oneof: 0
end

defmodule Flyteidl2.Actions.WatchForUpdatesResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.WatchForUpdatesResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :message, 0

  field :action_update, 1,
    type: Flyteidl2.Workflow.ActionUpdate,
    json_name: "actionUpdate",
    oneof: 0

  field :control_message, 2,
    type: Flyteidl2.Workflow.ControlMessage,
    json_name: "controlMessage",
    oneof: 0
end

defmodule Flyteidl2.Actions.AbortRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.AbortRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :reason, 2, proto3_optional: true, type: :string
end

defmodule Flyteidl2.Actions.AbortResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.actions.AbortResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Actions.ActionsService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.actions.ActionsService", protoc_gen_elixir_version: "0.16.0"

  rpc :Enqueue, Flyteidl2.Actions.EnqueueRequest, Flyteidl2.Actions.EnqueueResponse

  rpc :GetLatestState,
      Flyteidl2.Actions.GetLatestStateRequest,
      Flyteidl2.Actions.GetLatestStateResponse

  rpc :WatchForUpdates,
      Flyteidl2.Actions.WatchForUpdatesRequest,
      stream(Flyteidl2.Actions.WatchForUpdatesResponse)

  rpc :Update, Flyteidl2.Actions.UpdateRequest, Flyteidl2.Actions.UpdateResponse

  rpc :Abort, Flyteidl2.Actions.AbortRequest, Flyteidl2.Actions.AbortResponse
end

defmodule Flyteidl2.Actions.ActionsService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Actions.ActionsService.Service
end
