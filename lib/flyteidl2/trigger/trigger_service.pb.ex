defmodule Flyteidl2.Trigger.DeployTriggerRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.DeployTriggerRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 4, type: Flyteidl2.Common.TriggerName, deprecated: false
  field :revision, 5, type: :uint64
  field :spec, 2, type: Flyteidl2.Trigger.TriggerSpec, deprecated: false

  field :automation_spec, 3,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Trigger.DeployTriggerResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.DeployTriggerResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :trigger, 1, type: Flyteidl2.Trigger.TriggerDetails, deprecated: false
end

defmodule Flyteidl2.Trigger.GetTriggerDetailsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerDetailsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: Flyteidl2.Common.TriggerName, deprecated: false
end

defmodule Flyteidl2.Trigger.GetTriggerDetailsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerDetailsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :trigger, 1, type: Flyteidl2.Trigger.TriggerDetails, deprecated: false
end

defmodule Flyteidl2.Trigger.GetTriggerRevisionDetailsRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerRevisionDetailsRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.TriggerIdentifier, deprecated: false
end

defmodule Flyteidl2.Trigger.GetTriggerRevisionDetailsResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerRevisionDetailsResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :trigger, 1, type: Flyteidl2.Trigger.TriggerDetails, deprecated: false
end

defmodule Flyteidl2.Trigger.ListTriggersRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.ListTriggersRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :scope_by, 0

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :org, 2, type: :string, oneof: 0, deprecated: false
  field :project_id, 3, type: Flyteidl2.Common.ProjectIdentifier, json_name: "projectId", oneof: 0
  field :task_id, 4, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", oneof: 0
  field :task_name, 5, type: Flyteidl2.Task.TaskName, json_name: "taskName", oneof: 0
end

defmodule Flyteidl2.Trigger.ListTriggersResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.ListTriggersResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :triggers, 1, repeated: true, type: Flyteidl2.Trigger.Trigger
  field :token, 2, type: :string
end

defmodule Flyteidl2.Trigger.GetTriggerRevisionHistoryRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerRevisionHistoryRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :request, 1, type: Flyteidl2.Common.ListRequest
  field :name, 2, type: Flyteidl2.Common.TriggerName, deprecated: false
end

defmodule Flyteidl2.Trigger.GetTriggerRevisionHistoryResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.GetTriggerRevisionHistoryResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :triggers, 1, repeated: true, type: Flyteidl2.Trigger.TriggerRevision
  field :token, 2, type: :string
end

defmodule Flyteidl2.Trigger.UpdateTriggersRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.UpdateTriggersRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :names, 1, repeated: true, type: Flyteidl2.Common.TriggerName, deprecated: false
  field :active, 2, type: :bool
end

defmodule Flyteidl2.Trigger.UpdateTriggersResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.UpdateTriggersResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Trigger.DeleteTriggersRequest do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.DeleteTriggersRequest",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :names, 1, repeated: true, type: Flyteidl2.Common.TriggerName, deprecated: false
end

defmodule Flyteidl2.Trigger.DeleteTriggersResponse do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.trigger.DeleteTriggersResponse",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3
end

defmodule Flyteidl2.Trigger.TriggerService.Service do
  @moduledoc false

  use GRPC.Service, name: "flyteidl2.trigger.TriggerService", protoc_gen_elixir_version: "0.16.0"

  rpc :DeployTrigger,
      Flyteidl2.Trigger.DeployTriggerRequest,
      Flyteidl2.Trigger.DeployTriggerResponse

  rpc :GetTriggerDetails,
      Flyteidl2.Trigger.GetTriggerDetailsRequest,
      Flyteidl2.Trigger.GetTriggerDetailsResponse

  rpc :GetTriggerRevisionDetails,
      Flyteidl2.Trigger.GetTriggerRevisionDetailsRequest,
      Flyteidl2.Trigger.GetTriggerRevisionDetailsResponse

  rpc :ListTriggers, Flyteidl2.Trigger.ListTriggersRequest, Flyteidl2.Trigger.ListTriggersResponse

  rpc :GetTriggerRevisionHistory,
      Flyteidl2.Trigger.GetTriggerRevisionHistoryRequest,
      Flyteidl2.Trigger.GetTriggerRevisionHistoryResponse

  rpc :UpdateTriggers,
      Flyteidl2.Trigger.UpdateTriggersRequest,
      Flyteidl2.Trigger.UpdateTriggersResponse

  rpc :DeleteTriggers,
      Flyteidl2.Trigger.DeleteTriggersRequest,
      Flyteidl2.Trigger.DeleteTriggersResponse
end

defmodule Flyteidl2.Trigger.TriggerService.Stub do
  @moduledoc false

  use GRPC.Stub, service: Flyteidl2.Trigger.TriggerService.Service
end
