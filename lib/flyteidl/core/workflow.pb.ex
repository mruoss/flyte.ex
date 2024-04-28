defmodule Flyteidl.Core.WorkflowMetadata.OnFailurePolicy do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :FAIL_IMMEDIATELY, 0
  field :FAIL_AFTER_EXECUTABLE_NODES_COMPLETE, 1
end

defmodule Flyteidl.Core.IfBlock do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :condition, 1, type: Flyteidl.Core.BooleanExpression
  field :then_node, 2, type: Flyteidl.Core.Node, json_name: "thenNode"
end

defmodule Flyteidl.Core.IfElseBlock do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :default, 0

  field :case, 1, type: Flyteidl.Core.IfBlock
  field :other, 2, repeated: true, type: Flyteidl.Core.IfBlock
  field :else_node, 3, type: Flyteidl.Core.Node, json_name: "elseNode", oneof: 0
  field :error, 4, type: Flyteidl.Core.Error, oneof: 0
end

defmodule Flyteidl.Core.BranchNode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :if_else, 1, type: Flyteidl.Core.IfElseBlock, json_name: "ifElse"
end

defmodule Flyteidl.Core.TaskNode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :reference, 0

  field :reference_id, 1, type: Flyteidl.Core.Identifier, json_name: "referenceId", oneof: 0
  field :overrides, 2, type: Flyteidl.Core.TaskNodeOverrides
end

defmodule Flyteidl.Core.WorkflowNode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :reference, 0

  field :launchplan_ref, 1, type: Flyteidl.Core.Identifier, json_name: "launchplanRef", oneof: 0

  field :sub_workflow_ref, 2,
    type: Flyteidl.Core.Identifier,
    json_name: "subWorkflowRef",
    oneof: 0
end

defmodule Flyteidl.Core.ApproveCondition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signal_id, 1, type: :string, json_name: "signalId"
end

defmodule Flyteidl.Core.SignalCondition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :signal_id, 1, type: :string, json_name: "signalId"
  field :type, 2, type: Flyteidl.Core.LiteralType
  field :output_variable_name, 3, type: :string, json_name: "outputVariableName"
end

defmodule Flyteidl.Core.SleepCondition do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :duration, 1, type: Google.Protobuf.Duration
end

defmodule Flyteidl.Core.GateNode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :condition, 0

  field :approve, 1, type: Flyteidl.Core.ApproveCondition, oneof: 0
  field :signal, 2, type: Flyteidl.Core.SignalCondition, oneof: 0
  field :sleep, 3, type: Flyteidl.Core.SleepCondition, oneof: 0
end

defmodule Flyteidl.Core.ArrayNode do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :success_criteria, 0

  field :node, 1, type: Flyteidl.Core.Node
  field :parallelism, 2, type: :uint32
  field :min_successes, 3, type: :uint32, json_name: "minSuccesses", oneof: 0
  field :min_success_ratio, 4, type: :float, json_name: "minSuccessRatio", oneof: 0
end

defmodule Flyteidl.Core.NodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :interruptible_value, 0

  field :name, 1, type: :string
  field :timeout, 4, type: Google.Protobuf.Duration
  field :retries, 5, type: Flyteidl.Core.RetryStrategy
  field :interruptible, 6, type: :bool, oneof: 0
end

defmodule Flyteidl.Core.Alias do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :var, 1, type: :string
  field :alias, 2, type: :string
end

defmodule Flyteidl.Core.Node do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :target, 0

  field :id, 1, type: :string
  field :metadata, 2, type: Flyteidl.Core.NodeMetadata
  field :inputs, 3, repeated: true, type: Flyteidl.Core.Binding
  field :upstream_node_ids, 4, repeated: true, type: :string, json_name: "upstreamNodeIds"
  field :output_aliases, 5, repeated: true, type: Flyteidl.Core.Alias, json_name: "outputAliases"
  field :task_node, 6, type: Flyteidl.Core.TaskNode, json_name: "taskNode", oneof: 0
  field :workflow_node, 7, type: Flyteidl.Core.WorkflowNode, json_name: "workflowNode", oneof: 0
  field :branch_node, 8, type: Flyteidl.Core.BranchNode, json_name: "branchNode", oneof: 0
  field :gate_node, 9, type: Flyteidl.Core.GateNode, json_name: "gateNode", oneof: 0
  field :array_node, 10, type: Flyteidl.Core.ArrayNode, json_name: "arrayNode", oneof: 0
end

defmodule Flyteidl.Core.WorkflowMetadata.TagsEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Core.WorkflowMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :quality_of_service, 1,
    type: Flyteidl.Core.QualityOfService,
    json_name: "qualityOfService"

  field :on_failure, 2,
    type: Flyteidl.Core.WorkflowMetadata.OnFailurePolicy,
    json_name: "onFailure",
    enum: true

  field :tags, 3, repeated: true, type: Flyteidl.Core.WorkflowMetadata.TagsEntry, map: true
end

defmodule Flyteidl.Core.WorkflowMetadataDefaults do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :interruptible, 1, type: :bool
end

defmodule Flyteidl.Core.WorkflowTemplate do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :metadata, 2, type: Flyteidl.Core.WorkflowMetadata
  field :interface, 3, type: Flyteidl.Core.TypedInterface
  field :nodes, 4, repeated: true, type: Flyteidl.Core.Node
  field :outputs, 5, repeated: true, type: Flyteidl.Core.Binding
  field :failure_node, 6, type: Flyteidl.Core.Node, json_name: "failureNode"

  field :metadata_defaults, 7,
    type: Flyteidl.Core.WorkflowMetadataDefaults,
    json_name: "metadataDefaults"
end

defmodule Flyteidl.Core.TaskNodeOverrides do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resources, 1, type: Flyteidl.Core.Resources
end