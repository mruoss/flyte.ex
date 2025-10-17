defmodule Flyteidl2.Workflow.EnqueueActionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

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

defmodule Flyteidl2.Workflow.EnqueueActionResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Workflow.AbortQueuedRunRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId", deprecated: false
  field :reason, 2, proto3_optional: true, type: :string
end

defmodule Flyteidl2.Workflow.AbortQueuedRunResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Workflow.AbortQueuedActionRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :reason, 2, proto3_optional: true, type: :string
end

defmodule Flyteidl2.Workflow.AbortQueuedActionResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3
end

defmodule Flyteidl2.Workflow.QueueService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.workflow.QueueService", protoc_gen_elixir_version: "0.15.0"

  rpc :EnqueueAction,
      Flyteidl2.Workflow.EnqueueActionRequest,
      Flyteidl2.Workflow.EnqueueActionResponse

  rpc :AbortQueuedRun,
      Flyteidl2.Workflow.AbortQueuedRunRequest,
      Flyteidl2.Workflow.AbortQueuedRunResponse

  rpc :AbortQueuedAction,
      Flyteidl2.Workflow.AbortQueuedActionRequest,
      Flyteidl2.Workflow.AbortQueuedActionResponse
end

defmodule Flyteidl2.Workflow.QueueService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.QueueService.Service
end
