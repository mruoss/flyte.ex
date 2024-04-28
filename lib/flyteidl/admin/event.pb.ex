defmodule Flyteidl.Admin.EventErrorAlreadyInTerminalState do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :current_phase, 1, type: :string, json_name: "currentPhase"
end

defmodule Flyteidl.Admin.EventErrorIncompatibleCluster do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cluster, 1, type: :string
end

defmodule Flyteidl.Admin.EventFailureReason do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :reason, 0

  field :already_in_terminal_state, 1,
    type: Flyteidl.Admin.EventErrorAlreadyInTerminalState,
    json_name: "alreadyInTerminalState",
    oneof: 0

  field :incompatible_cluster, 2,
    type: Flyteidl.Admin.EventErrorIncompatibleCluster,
    json_name: "incompatibleCluster",
    oneof: 0
end

defmodule Flyteidl.Admin.WorkflowExecutionEventRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_id, 1, type: :string, json_name: "requestId"
  field :event, 2, type: Flyteidl.Event.WorkflowExecutionEvent
end

defmodule Flyteidl.Admin.WorkflowExecutionEventResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.NodeExecutionEventRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_id, 1, type: :string, json_name: "requestId"
  field :event, 2, type: Flyteidl.Event.NodeExecutionEvent
end

defmodule Flyteidl.Admin.NodeExecutionEventResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.TaskExecutionEventRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :request_id, 1, type: :string, json_name: "requestId"
  field :event, 2, type: Flyteidl.Event.TaskExecutionEvent
end

defmodule Flyteidl.Admin.TaskExecutionEventResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end