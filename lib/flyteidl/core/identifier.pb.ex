defmodule Flyteidl.Core.ResourceType do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :UNSPECIFIED, 0
  field :TASK, 1
  field :WORKFLOW, 2
  field :LAUNCH_PLAN, 3
  field :DATASET, 4
end

defmodule Flyteidl.Core.Identifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1, type: Flyteidl.Core.ResourceType, json_name: "resourceType", enum: true
  field :project, 2, type: :string
  field :domain, 3, type: :string
  field :name, 4, type: :string
  field :version, 5, type: :string
end

defmodule Flyteidl.Core.WorkflowExecutionIdentifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :name, 4, type: :string
end

defmodule Flyteidl.Core.NodeExecutionIdentifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_id, 1, type: :string, json_name: "nodeId"

  field :execution_id, 2,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end

defmodule Flyteidl.Core.TaskExecutionIdentifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_id, 1, type: Flyteidl.Core.Identifier, json_name: "taskId"

  field :node_execution_id, 2,
    type: Flyteidl.Core.NodeExecutionIdentifier,
    json_name: "nodeExecutionId"

  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
end

defmodule Flyteidl.Core.SignalIdentifier do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signal_id, 1, type: :string, json_name: "signalId"

  field :execution_id, 2,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end