defmodule Flyteidl.Core.Span do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :id, 0

  field :start_time, 1, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 2, type: Google.Protobuf.Timestamp, json_name: "endTime"

  field :workflow_id, 3,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "workflowId",
    oneof: 0

  field :node_id, 4, type: Flyteidl.Core.NodeExecutionIdentifier, json_name: "nodeId", oneof: 0
  field :task_id, 5, type: Flyteidl.Core.TaskExecutionIdentifier, json_name: "taskId", oneof: 0
  field :operation_id, 6, type: :string, json_name: "operationId", oneof: 0
  field :spans, 7, repeated: true, type: Flyteidl.Core.Span
end