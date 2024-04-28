defmodule Flyteidl.Admin.ExecutionState do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :EXECUTION_ACTIVE, 0
  field :EXECUTION_ARCHIVED, 1
end

defmodule Flyteidl.Admin.ExecutionMetadata.ExecutionMode do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :MANUAL, 0
  field :SCHEDULED, 1
  field :SYSTEM, 2
  field :RELAUNCH, 3
  field :CHILD_WORKFLOW, 4
  field :RECOVERED, 5
end

defmodule Flyteidl.Admin.ExecutionCreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :name, 3, type: :string
  field :spec, 4, type: Flyteidl.Admin.ExecutionSpec
  field :inputs, 5, type: Flyteidl.Core.LiteralMap
end

defmodule Flyteidl.Admin.ExecutionRelaunchRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :name, 3, type: :string
  field :overwrite_cache, 4, type: :bool, json_name: "overwriteCache"
end

defmodule Flyteidl.Admin.ExecutionRecoverRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :name, 2, type: :string
  field :metadata, 3, type: Flyteidl.Admin.ExecutionMetadata
end

defmodule Flyteidl.Admin.ExecutionCreateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
end

defmodule Flyteidl.Admin.WorkflowExecutionGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
end

defmodule Flyteidl.Admin.Execution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :spec, 2, type: Flyteidl.Admin.ExecutionSpec
  field :closure, 3, type: Flyteidl.Admin.ExecutionClosure
end

defmodule Flyteidl.Admin.ExecutionList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :executions, 1, repeated: true, type: Flyteidl.Admin.Execution
  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.LiteralMapBlob do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :data, 0

  field :values, 1, type: Flyteidl.Core.LiteralMap, oneof: 0, deprecated: true
  field :uri, 2, type: :string, oneof: 0
end

defmodule Flyteidl.Admin.AbortMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cause, 1, type: :string
  field :principal, 2, type: :string
end

defmodule Flyteidl.Admin.ExecutionClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_result, 0

  field :outputs, 1, type: Flyteidl.Admin.LiteralMapBlob, oneof: 0, deprecated: true
  field :error, 2, type: Flyteidl.Core.ExecutionError, oneof: 0
  field :abort_cause, 10, type: :string, json_name: "abortCause", oneof: 0, deprecated: true

  field :abort_metadata, 12,
    type: Flyteidl.Admin.AbortMetadata,
    json_name: "abortMetadata",
    oneof: 0

  field :output_data, 13,
    type: Flyteidl.Core.LiteralMap,
    json_name: "outputData",
    oneof: 0,
    deprecated: true

  field :computed_inputs, 3,
    type: Flyteidl.Core.LiteralMap,
    json_name: "computedInputs",
    deprecated: true

  field :phase, 4, type: Flyteidl.Core.WorkflowExecution.Phase, enum: true
  field :started_at, 5, type: Google.Protobuf.Timestamp, json_name: "startedAt"
  field :duration, 6, type: Google.Protobuf.Duration
  field :created_at, 7, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :updated_at, 8, type: Google.Protobuf.Timestamp, json_name: "updatedAt"
  field :notifications, 9, repeated: true, type: Flyteidl.Admin.Notification
  field :workflow_id, 11, type: Flyteidl.Core.Identifier, json_name: "workflowId"

  field :state_change_details, 14,
    type: Flyteidl.Admin.ExecutionStateChangeDetails,
    json_name: "stateChangeDetails"
end

defmodule Flyteidl.Admin.SystemMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :execution_cluster, 1, type: :string, json_name: "executionCluster"
  field :namespace, 2, type: :string
end

defmodule Flyteidl.Admin.ExecutionMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :mode, 1, type: Flyteidl.Admin.ExecutionMetadata.ExecutionMode, enum: true
  field :principal, 2, type: :string
  field :nesting, 3, type: :uint32
  field :scheduled_at, 4, type: Google.Protobuf.Timestamp, json_name: "scheduledAt"

  field :parent_node_execution, 5,
    type: Flyteidl.Core.NodeExecutionIdentifier,
    json_name: "parentNodeExecution"

  field :reference_execution, 16,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "referenceExecution"

  field :system_metadata, 17, type: Flyteidl.Admin.SystemMetadata, json_name: "systemMetadata"
end

defmodule Flyteidl.Admin.NotificationList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :notifications, 1, repeated: true, type: Flyteidl.Admin.Notification
end

defmodule Flyteidl.Admin.ExecutionSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :notification_overrides, 0

  field :launch_plan, 1, type: Flyteidl.Core.Identifier, json_name: "launchPlan"
  field :inputs, 2, type: Flyteidl.Core.LiteralMap, deprecated: true
  field :metadata, 3, type: Flyteidl.Admin.ExecutionMetadata
  field :notifications, 5, type: Flyteidl.Admin.NotificationList, oneof: 0
  field :disable_all, 6, type: :bool, json_name: "disableAll", oneof: 0
  field :labels, 7, type: Flyteidl.Admin.Labels
  field :annotations, 8, type: Flyteidl.Admin.Annotations
  field :security_context, 10, type: Flyteidl.Core.SecurityContext, json_name: "securityContext"
  field :auth_role, 16, type: Flyteidl.Admin.AuthRole, json_name: "authRole", deprecated: true

  field :quality_of_service, 17,
    type: Flyteidl.Core.QualityOfService,
    json_name: "qualityOfService"

  field :max_parallelism, 18, type: :int32, json_name: "maxParallelism"

  field :raw_output_data_config, 19,
    type: Flyteidl.Admin.RawOutputDataConfig,
    json_name: "rawOutputDataConfig"

  field :cluster_assignment, 20,
    type: Flyteidl.Admin.ClusterAssignment,
    json_name: "clusterAssignment"

  field :interruptible, 21, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 22, type: :bool, json_name: "overwriteCache"
  field :envs, 23, type: Flyteidl.Admin.Envs
  field :tags, 24, repeated: true, type: :string
end

defmodule Flyteidl.Admin.ExecutionTerminateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :cause, 2, type: :string
end

defmodule Flyteidl.Admin.ExecutionTerminateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.WorkflowExecutionGetDataRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
end

defmodule Flyteidl.Admin.WorkflowExecutionGetDataResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :outputs, 1, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :inputs, 2, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :full_inputs, 3, type: Flyteidl.Core.LiteralMap, json_name: "fullInputs"
  field :full_outputs, 4, type: Flyteidl.Core.LiteralMap, json_name: "fullOutputs"
end

defmodule Flyteidl.Admin.ExecutionUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :state, 2, type: Flyteidl.Admin.ExecutionState, enum: true
end

defmodule Flyteidl.Admin.ExecutionStateChangeDetails do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :state, 1, type: Flyteidl.Admin.ExecutionState, enum: true
  field :occurred_at, 2, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :principal, 3, type: :string
end

defmodule Flyteidl.Admin.ExecutionUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.WorkflowExecutionGetMetricsRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
  field :depth, 2, type: :int32
end

defmodule Flyteidl.Admin.WorkflowExecutionGetMetricsResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :span, 1, type: Flyteidl.Core.Span
end