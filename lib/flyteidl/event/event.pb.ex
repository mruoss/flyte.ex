defmodule Flyteidl.Event.TaskExecutionMetadata.InstanceClass do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :DEFAULT, 0
  field :INTERRUPTIBLE, 1
end

defmodule Flyteidl.Event.WorkflowExecutionEvent do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_result, 0

  field :execution_id, 1,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"

  field :producer_id, 2, type: :string, json_name: "producerId"
  field :phase, 3, type: Flyteidl.Core.WorkflowExecution.Phase, enum: true
  field :occurred_at, 4, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :output_uri, 5, type: :string, json_name: "outputUri", oneof: 0
  field :error, 6, type: Flyteidl.Core.ExecutionError, oneof: 0
  field :output_data, 7, type: Flyteidl.Core.LiteralMap, json_name: "outputData", oneof: 0
end

defmodule Flyteidl.Event.NodeExecutionEvent do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :input_value, 0

  oneof :output_result, 1

  oneof :target_metadata, 2

  field :id, 1, type: Flyteidl.Core.NodeExecutionIdentifier
  field :producer_id, 2, type: :string, json_name: "producerId"
  field :phase, 3, type: Flyteidl.Core.NodeExecution.Phase, enum: true
  field :occurred_at, 4, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :input_uri, 5, type: :string, json_name: "inputUri", oneof: 0
  field :input_data, 20, type: Flyteidl.Core.LiteralMap, json_name: "inputData", oneof: 0
  field :output_uri, 6, type: :string, json_name: "outputUri", oneof: 1
  field :error, 7, type: Flyteidl.Core.ExecutionError, oneof: 1
  field :output_data, 15, type: Flyteidl.Core.LiteralMap, json_name: "outputData", oneof: 1

  field :workflow_node_metadata, 8,
    type: Flyteidl.Event.WorkflowNodeMetadata,
    json_name: "workflowNodeMetadata",
    oneof: 2

  field :task_node_metadata, 14,
    type: Flyteidl.Event.TaskNodeMetadata,
    json_name: "taskNodeMetadata",
    oneof: 2

  field :parent_task_metadata, 9,
    type: Flyteidl.Event.ParentTaskExecutionMetadata,
    json_name: "parentTaskMetadata"

  field :parent_node_metadata, 10,
    type: Flyteidl.Event.ParentNodeExecutionMetadata,
    json_name: "parentNodeMetadata"

  field :retry_group, 11, type: :string, json_name: "retryGroup"
  field :spec_node_id, 12, type: :string, json_name: "specNodeId"
  field :node_name, 13, type: :string, json_name: "nodeName"
  field :event_version, 16, type: :int32, json_name: "eventVersion"
  field :is_parent, 17, type: :bool, json_name: "isParent"
  field :is_dynamic, 18, type: :bool, json_name: "isDynamic"
  field :deck_uri, 19, type: :string, json_name: "deckUri"
  field :reported_at, 21, type: Google.Protobuf.Timestamp, json_name: "reportedAt"
end

defmodule Flyteidl.Event.WorkflowNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :execution_id, 1,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end

defmodule Flyteidl.Event.TaskNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cache_status, 1,
    type: Flyteidl.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :catalog_key, 2, type: Flyteidl.Core.CatalogMetadata, json_name: "catalogKey"

  field :reservation_status, 3,
    type: Flyteidl.Core.CatalogReservation.Status,
    json_name: "reservationStatus",
    enum: true

  field :checkpoint_uri, 4, type: :string, json_name: "checkpointUri"

  field :dynamic_workflow, 16,
    type: Flyteidl.Event.DynamicWorkflowNodeMetadata,
    json_name: "dynamicWorkflow"
end

defmodule Flyteidl.Event.DynamicWorkflowNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier

  field :compiled_workflow, 2,
    type: Flyteidl.Core.CompiledWorkflowClosure,
    json_name: "compiledWorkflow"

  field :dynamic_job_spec_uri, 3, type: :string, json_name: "dynamicJobSpecUri"
end

defmodule Flyteidl.Event.ParentTaskExecutionMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.TaskExecutionIdentifier
end

defmodule Flyteidl.Event.ParentNodeExecutionMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_id, 1, type: :string, json_name: "nodeId"
end

defmodule Flyteidl.Event.EventReason do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :reason, 1, type: :string
  field :occurred_at, 2, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
end

defmodule Flyteidl.Event.TaskExecutionEvent do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :input_value, 0

  oneof :output_result, 1

  field :task_id, 1, type: Flyteidl.Core.Identifier, json_name: "taskId"

  field :parent_node_execution_id, 2,
    type: Flyteidl.Core.NodeExecutionIdentifier,
    json_name: "parentNodeExecutionId"

  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
  field :phase, 4, type: Flyteidl.Core.TaskExecution.Phase, enum: true
  field :producer_id, 5, type: :string, json_name: "producerId"
  field :logs, 6, repeated: true, type: Flyteidl.Core.TaskLog
  field :occurred_at, 7, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :input_uri, 8, type: :string, json_name: "inputUri", oneof: 0
  field :input_data, 19, type: Flyteidl.Core.LiteralMap, json_name: "inputData", oneof: 0
  field :output_uri, 9, type: :string, json_name: "outputUri", oneof: 1
  field :error, 10, type: Flyteidl.Core.ExecutionError, oneof: 1
  field :output_data, 17, type: Flyteidl.Core.LiteralMap, json_name: "outputData", oneof: 1
  field :custom_info, 11, type: Google.Protobuf.Struct, json_name: "customInfo"
  field :phase_version, 12, type: :uint32, json_name: "phaseVersion"
  field :reason, 13, type: :string, deprecated: true
  field :reasons, 21, repeated: true, type: Flyteidl.Event.EventReason
  field :task_type, 14, type: :string, json_name: "taskType"
  field :metadata, 16, type: Flyteidl.Event.TaskExecutionMetadata
  field :event_version, 18, type: :int32, json_name: "eventVersion"
  field :reported_at, 20, type: Google.Protobuf.Timestamp, json_name: "reportedAt"
end

defmodule Flyteidl.Event.ExternalResourceInfo do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :external_id, 1, type: :string, json_name: "externalId"
  field :index, 2, type: :uint32
  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
  field :phase, 4, type: Flyteidl.Core.TaskExecution.Phase, enum: true

  field :cache_status, 5,
    type: Flyteidl.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :logs, 6, repeated: true, type: Flyteidl.Core.TaskLog
end

defmodule Flyteidl.Event.ResourcePoolInfo do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :allocation_token, 1, type: :string, json_name: "allocationToken"
  field :namespace, 2, type: :string
end

defmodule Flyteidl.Event.TaskExecutionMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :generated_name, 1, type: :string, json_name: "generatedName"

  field :external_resources, 2,
    repeated: true,
    type: Flyteidl.Event.ExternalResourceInfo,
    json_name: "externalResources"

  field :resource_pool_info, 3,
    repeated: true,
    type: Flyteidl.Event.ResourcePoolInfo,
    json_name: "resourcePoolInfo"

  field :plugin_identifier, 4, type: :string, json_name: "pluginIdentifier"

  field :instance_class, 16,
    type: Flyteidl.Event.TaskExecutionMetadata.InstanceClass,
    json_name: "instanceClass",
    enum: true
end