defmodule Flyteidl2.Workflow.PutRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :parent_action_name, 2,
    proto3_optional: true,
    type: :string,
    json_name: "parentActionName"

  field :state, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Workflow.PutResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Google.Rpc.Status, deprecated: false
end

defmodule Flyteidl2.Workflow.GetRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false
end

defmodule Flyteidl2.Workflow.GetResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :status, 2, type: Google.Rpc.Status, deprecated: false
  field :state, 3, type: :string, deprecated: false
end

defmodule Flyteidl2.Workflow.WatchRequest do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :filter, 0

  field :parent_action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "parentActionId",
    oneof: 0
end

defmodule Flyteidl2.Workflow.WatchResponse do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

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

defmodule Flyteidl2.Workflow.ControlMessage do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :sentinel, 1, type: :bool
end

defmodule Flyteidl2.Workflow.ActionUpdate do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :phase, 2, type: Flyteidl2.Common.ActionPhase, enum: true
  field :error, 3, proto3_optional: true, type: Flyteidl2.Core.ExecutionError
  field :output_uri, 4, type: :string, json_name: "outputUri"
end

defmodule Flyteidl2.Workflow.StateService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.workflow.StateService", protoc_gen_elixir_version: "0.15.0"

  rpc :Put, Flyteidl2.Workflow.PutRequest, Flyteidl2.Workflow.PutResponse

  rpc :Get, Flyteidl2.Workflow.GetRequest, Flyteidl2.Workflow.GetResponse

  rpc :Watch, Flyteidl2.Workflow.WatchRequest, stream(Flyteidl2.Workflow.WatchResponse)
end

defmodule Flyteidl2.Workflow.StateService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Workflow.StateService.Service
end
