defmodule Flyteidl2.Workflow.RecordActionRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :spec, 0

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :parent, 4, type: :string
  field :group, 5, type: :string
  field :subject, 6, type: :string
  field :input_uri, 7, type: :string, json_name: "inputUri"
  field :task, 10, type: Flyteidl2.Workflow.TaskAction, oneof: 0
  field :trace, 11, type: Flyteidl2.Workflow.TraceAction, oneof: 0
  field :condition, 12, type: Flyteidl2.Workflow.ConditionAction, oneof: 0
end

defmodule Flyteidl2.Workflow.RecordActionResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Google.Rpc.Status, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordActionStreamRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionStreamRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Workflow.RecordActionRequest
end

defmodule Flyteidl2.Workflow.RecordActionStreamResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionStreamResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :response, 1, type: Flyteidl2.Workflow.RecordActionResponse
end

defmodule Flyteidl2.Workflow.UpdateActionStatusRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.UpdateActionStatusRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Flyteidl2.Workflow.ActionStatus, deprecated: false
end

defmodule Flyteidl2.Workflow.UpdateActionStatusResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.UpdateActionStatusResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Google.Rpc.Status, deprecated: false
end

defmodule Flyteidl2.Workflow.UpdateActionStatusStreamRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.UpdateActionStatusStreamRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Workflow.UpdateActionStatusRequest
  field :nonce, 2, type: :int64
end

defmodule Flyteidl2.Workflow.UpdateActionStatusStreamResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.UpdateActionStatusStreamResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :response, 1, type: Flyteidl2.Workflow.UpdateActionStatusResponse
  field :nonce, 2, type: :int64
end

defmodule Flyteidl2.Workflow.RecordActionEventRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :event, 1, type: Flyteidl2.Workflow.ActionEvent, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordActionEventResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Google.Rpc.Status, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordActionEventsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :events, 1, repeated: true, type: Flyteidl2.Workflow.ActionEvent, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordActionEventsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :status, 1, type: Google.Rpc.Status, deprecated: false
end

defmodule Flyteidl2.Workflow.RecordActionEventStreamRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventStreamRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Workflow.RecordActionEventRequest, deprecated: false
  field :nonce, 2, type: :int64
end

defmodule Flyteidl2.Workflow.RecordActionEventStreamResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.workflow.RecordActionEventStreamResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :response, 1, type: Flyteidl2.Workflow.RecordActionEventResponse, deprecated: false
  field :nonce, 2, type: :int64
end

defmodule Flyteidl2.Workflow.InternalRunService.Service do
  @moduledoc false

  use GRPC.Service,
    name: "flyteidl2.workflow.InternalRunService",
    protoc_gen_elixir_version: "0.16.0"

  rpc :RecordAction,
      Flyteidl2.Workflow.RecordActionRequest,
      Flyteidl2.Workflow.RecordActionResponse

  rpc :RecordActionStream,
      stream(Flyteidl2.Workflow.RecordActionStreamRequest),
      stream(Flyteidl2.Workflow.RecordActionStreamResponse)

  rpc :UpdateActionStatus,
      Flyteidl2.Workflow.UpdateActionStatusRequest,
      Flyteidl2.Workflow.UpdateActionStatusResponse

  rpc :UpdateActionStatusStream,
      stream(Flyteidl2.Workflow.UpdateActionStatusStreamRequest),
      stream(Flyteidl2.Workflow.UpdateActionStatusStreamResponse)

  rpc :RecordActionEvents,
      Flyteidl2.Workflow.RecordActionEventsRequest,
      Flyteidl2.Workflow.RecordActionEventsResponse

  rpc :RecordActionEventStream,
      stream(Flyteidl2.Workflow.RecordActionEventStreamRequest),
      stream(Flyteidl2.Workflow.RecordActionEventStreamResponse)
end

defmodule Flyteidl2.Workflow.InternalRunService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.InternalRunService.Service
end
