defmodule Flyteidl.Plugins.Waitable do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :wf_exec_id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier, json_name: "wfExecId"
  field :phase, 2, type: Flyteidl.Core.WorkflowExecution.Phase, enum: true
  field :workflow_id, 3, type: :string, json_name: "workflowId"
end