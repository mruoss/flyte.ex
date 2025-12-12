defmodule Flyteidl2.Event.TaskExecutionMetadata.InstanceClass do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :DEFAULT, 0
  field :INTERRUPTIBLE, 1
end

defmodule Flyteidl2.Event.WorkflowExecutionEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :output_result, 0

  field :execution_id, 1,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"

  field :producer_id, 2, type: :string, json_name: "producerId"
  field :phase, 3, type: Flyteidl2.Core.WorkflowExecution.Phase, enum: true
  field :occurred_at, 4, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :output_uri, 5, type: :string, json_name: "outputUri", oneof: 0
  field :error, 6, type: Flyteidl2.Core.ExecutionError, oneof: 0
  field :output_data, 7, type: Flyteidl2.Core.LiteralMap, json_name: "outputData", oneof: 0
end

defmodule Flyteidl2.Event.NodeExecutionEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :input_value, 0

  oneof :output_result, 1

  oneof :target_metadata, 2

  field :id, 1, type: Flyteidl2.Core.NodeExecutionIdentifier
  field :producer_id, 2, type: :string, json_name: "producerId"
  field :phase, 3, type: Flyteidl2.Core.NodeExecution.Phase, enum: true
  field :occurred_at, 4, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :input_uri, 5, type: :string, json_name: "inputUri", oneof: 0
  field :input_data, 20, type: Flyteidl2.Core.LiteralMap, json_name: "inputData", oneof: 0
  field :output_uri, 6, type: :string, json_name: "outputUri", oneof: 1
  field :error, 7, type: Flyteidl2.Core.ExecutionError, oneof: 1
  field :output_data, 15, type: Flyteidl2.Core.LiteralMap, json_name: "outputData", oneof: 1

  field :workflow_node_metadata, 8,
    type: Flyteidl2.Event.WorkflowNodeMetadata,
    json_name: "workflowNodeMetadata",
    oneof: 2

  field :task_node_metadata, 14,
    type: Flyteidl2.Event.TaskNodeMetadata,
    json_name: "taskNodeMetadata",
    oneof: 2

  field :parent_task_metadata, 9,
    type: Flyteidl2.Event.ParentTaskExecutionMetadata,
    json_name: "parentTaskMetadata"

  field :parent_node_metadata, 10,
    type: Flyteidl2.Event.ParentNodeExecutionMetadata,
    json_name: "parentNodeMetadata"

  field :retry_group, 11, type: :string, json_name: "retryGroup"
  field :spec_node_id, 12, type: :string, json_name: "specNodeId"
  field :node_name, 13, type: :string, json_name: "nodeName"
  field :event_version, 16, type: :int32, json_name: "eventVersion"
  field :is_parent, 17, type: :bool, json_name: "isParent"
  field :is_dynamic, 18, type: :bool, json_name: "isDynamic"
  field :deck_uri, 19, type: :string, json_name: "deckUri"
  field :reported_at, 21, type: Google.Protobuf.Timestamp, json_name: "reportedAt"
  field :is_array, 22, type: :bool, json_name: "isArray"
  field :target_entity, 23, type: Flyteidl2.Core.Identifier, json_name: "targetEntity"
  field :is_in_dynamic_chain, 24, type: :bool, json_name: "isInDynamicChain"
  field :is_eager, 25, type: :bool, json_name: "isEager"
end

defmodule Flyteidl2.Event.WorkflowNodeMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :execution_id, 1,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"
end

defmodule Flyteidl2.Event.TaskNodeMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :cache_status, 1,
    type: Flyteidl2.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :catalog_key, 2, type: Flyteidl2.Core.CatalogMetadata, json_name: "catalogKey"

  field :reservation_status, 3,
    type: Flyteidl2.Core.CatalogReservation.Status,
    json_name: "reservationStatus",
    enum: true

  field :checkpoint_uri, 4, type: :string, json_name: "checkpointUri"
end

defmodule Flyteidl2.Event.ParentTaskExecutionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Core.TaskExecutionIdentifier
end

defmodule Flyteidl2.Event.ParentNodeExecutionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :node_id, 1, type: :string, json_name: "nodeId"
end

defmodule Flyteidl2.Event.EventReason do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reason, 1, type: :string
  field :occurred_at, 2, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
end

defmodule Flyteidl2.Event.TaskExecutionEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :input_value, 0

  oneof :output_result, 1

  field :task_id, 1, type: Flyteidl2.Core.Identifier, json_name: "taskId"

  field :parent_node_execution_id, 2,
    type: Flyteidl2.Core.NodeExecutionIdentifier,
    json_name: "parentNodeExecutionId"

  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
  field :phase, 4, type: Flyteidl2.Core.TaskExecution.Phase, enum: true
  field :producer_id, 5, type: :string, json_name: "producerId"
  field :logs, 6, repeated: true, type: Flyteidl2.Core.TaskLog
  field :occurred_at, 7, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :input_uri, 8, type: :string, json_name: "inputUri", oneof: 0
  field :input_data, 19, type: Flyteidl2.Core.LiteralMap, json_name: "inputData", oneof: 0
  field :output_uri, 9, type: :string, json_name: "outputUri", oneof: 1
  field :error, 10, type: Flyteidl2.Core.ExecutionError, oneof: 1
  field :output_data, 17, type: Flyteidl2.Core.LiteralMap, json_name: "outputData", oneof: 1
  field :custom_info, 11, type: Google.Protobuf.Struct, json_name: "customInfo"
  field :phase_version, 12, type: :uint32, json_name: "phaseVersion"
  field :reason, 13, type: :string, deprecated: true
  field :reasons, 21, repeated: true, type: Flyteidl2.Event.EventReason
  field :task_type, 14, type: :string, json_name: "taskType"
  field :metadata, 16, type: Flyteidl2.Event.TaskExecutionMetadata
  field :event_version, 18, type: :int32, json_name: "eventVersion"
  field :reported_at, 20, type: Google.Protobuf.Timestamp, json_name: "reportedAt"
  field :log_context, 22, type: Flyteidl2.Core.LogContext, json_name: "logContext"
end

defmodule Flyteidl2.Event.ExternalResourceInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :target_metadata, 0

  field :external_id, 1, type: :string, json_name: "externalId"
  field :index, 2, type: :uint32
  field :retry_attempt, 3, type: :uint32, json_name: "retryAttempt"
  field :phase, 4, type: Flyteidl2.Core.TaskExecution.Phase, enum: true

  field :cache_status, 5,
    type: Flyteidl2.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :logs, 6, repeated: true, type: Flyteidl2.Core.TaskLog

  field :workflow_node_metadata, 7,
    type: Flyteidl2.Event.WorkflowNodeMetadata,
    json_name: "workflowNodeMetadata",
    oneof: 0

  field :custom_info, 8, type: Google.Protobuf.Struct, json_name: "customInfo"
  field :log_context, 9, type: Flyteidl2.Core.LogContext, json_name: "logContext"
end

defmodule Flyteidl2.Event.ResourcePoolInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :allocation_token, 1, type: :string, json_name: "allocationToken"
  field :namespace, 2, type: :string
end

defmodule Flyteidl2.Event.TaskExecutionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :generated_name, 1, type: :string, json_name: "generatedName"

  field :external_resources, 2,
    repeated: true,
    type: Flyteidl2.Event.ExternalResourceInfo,
    json_name: "externalResources"

  field :resource_pool_info, 3,
    repeated: true,
    type: Flyteidl2.Event.ResourcePoolInfo,
    json_name: "resourcePoolInfo"

  field :plugin_identifier, 4, type: :string, json_name: "pluginIdentifier"

  field :instance_class, 16,
    type: Flyteidl2.Event.TaskExecutionMetadata.InstanceClass,
    json_name: "instanceClass",
    enum: true
end
