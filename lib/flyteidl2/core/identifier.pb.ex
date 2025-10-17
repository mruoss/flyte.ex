defmodule Flyteidl2.Core.ResourceType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :UNSPECIFIED, 0
  field :TASK, 1
  field :WORKFLOW, 2
  field :LAUNCH_PLAN, 3
  field :DATASET, 4
end

defmodule Flyteidl2.Core.Identifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource_type, 1,
    type: Flyteidl2.Core.ResourceType,
    json_name: "resourceType",
    enum: true

  field :project, 2, type: :string
  field :domain, 3, type: :string
  field :name, 4, type: :string
  field :version, 5, type: :string
  field :org, 6, type: :string
end

defmodule Flyteidl2.Core.WorkflowExecutionIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :name, 4, type: :string
  field :org, 5, type: :string
end

defmodule Flyteidl2.Core.NodeExecutionIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :node_id, 1, type: :string, json_name: "nodeId"

  field :execution_id, 2,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end

defmodule Flyteidl2.Core.TaskExecutionIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Core.Identifier, json_name: "taskId"

  field :node_execution_id, 2,
    type: Flyteidl2.Core.NodeExecutionIdentifier,
    json_name: "nodeExecutionId"

  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
end

defmodule Flyteidl2.Core.SignalIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :signal_id, 1, type: :string, json_name: "signalId"

  field :execution_id, 2,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end
