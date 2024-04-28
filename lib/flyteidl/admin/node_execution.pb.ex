defmodule Flyteidl.Admin.NodeExecutionGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.NodeExecutionIdentifier
end

defmodule Flyteidl.Admin.NodeExecutionListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workflow_execution_id, 1,
    type: Flyteidl.Core.WorkflowExecutionIdentifier,
    json_name: "workflowExecutionId"

  field :limit, 2, type: :uint32
  field :token, 3, type: :string
  field :filters, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
  field :unique_parent_id, 6, type: :string, json_name: "uniqueParentId"
end

defmodule Flyteidl.Admin.NodeExecutionForTaskListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_execution_id, 1,
    type: Flyteidl.Core.TaskExecutionIdentifier,
    json_name: "taskExecutionId"

  field :limit, 2, type: :uint32
  field :token, 3, type: :string
  field :filters, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end

defmodule Flyteidl.Admin.NodeExecution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.NodeExecutionIdentifier
  field :input_uri, 2, type: :string, json_name: "inputUri"
  field :closure, 3, type: Flyteidl.Admin.NodeExecutionClosure
  field :metadata, 4, type: Flyteidl.Admin.NodeExecutionMetaData
end

defmodule Flyteidl.Admin.NodeExecutionMetaData do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :retry_group, 1, type: :string, json_name: "retryGroup"
  field :is_parent_node, 2, type: :bool, json_name: "isParentNode"
  field :spec_node_id, 3, type: :string, json_name: "specNodeId"
  field :is_dynamic, 4, type: :bool, json_name: "isDynamic"
end

defmodule Flyteidl.Admin.NodeExecutionList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_executions, 1,
    repeated: true,
    type: Flyteidl.Admin.NodeExecution,
    json_name: "nodeExecutions"

  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.NodeExecutionClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_result, 0

  oneof :target_metadata, 1

  field :output_uri, 1, type: :string, json_name: "outputUri", oneof: 0, deprecated: true
  field :error, 2, type: Flyteidl.Core.ExecutionError, oneof: 0

  field :output_data, 10,
    type: Flyteidl.Core.LiteralMap,
    json_name: "outputData",
    oneof: 0,
    deprecated: true

  field :phase, 3, type: Flyteidl.Core.NodeExecution.Phase, enum: true
  field :started_at, 4, type: Google.Protobuf.Timestamp, json_name: "startedAt"
  field :duration, 5, type: Google.Protobuf.Duration
  field :created_at, 6, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :updated_at, 7, type: Google.Protobuf.Timestamp, json_name: "updatedAt"

  field :workflow_node_metadata, 8,
    type: Flyteidl.Admin.WorkflowNodeMetadata,
    json_name: "workflowNodeMetadata",
    oneof: 1

  field :task_node_metadata, 9,
    type: Flyteidl.Admin.TaskNodeMetadata,
    json_name: "taskNodeMetadata",
    oneof: 1

  field :deck_uri, 11, type: :string, json_name: "deckUri"
  field :dynamic_job_spec_uri, 12, type: :string, json_name: "dynamicJobSpecUri"
end

defmodule Flyteidl.Admin.WorkflowNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :executionId, 1, type: Flyteidl.Core.WorkflowExecutionIdentifier
end

defmodule Flyteidl.Admin.TaskNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cache_status, 1,
    type: Flyteidl.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :catalog_key, 2, type: Flyteidl.Core.CatalogMetadata, json_name: "catalogKey"
  field :checkpoint_uri, 4, type: :string, json_name: "checkpointUri"
end

defmodule Flyteidl.Admin.DynamicWorkflowNodeMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier

  field :compiled_workflow, 2,
    type: Flyteidl.Core.CompiledWorkflowClosure,
    json_name: "compiledWorkflow"

  field :dynamic_job_spec_uri, 3, type: :string, json_name: "dynamicJobSpecUri"
end

defmodule Flyteidl.Admin.NodeExecutionGetDataRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.NodeExecutionIdentifier
end

defmodule Flyteidl.Admin.NodeExecutionGetDataResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :outputs, 2, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :full_inputs, 3, type: Flyteidl.Core.LiteralMap, json_name: "fullInputs"
  field :full_outputs, 4, type: Flyteidl.Core.LiteralMap, json_name: "fullOutputs"

  field :dynamic_workflow, 16,
    type: Flyteidl.Admin.DynamicWorkflowNodeMetadata,
    json_name: "dynamicWorkflow"

  field :flyte_urls, 17, type: Flyteidl.Admin.FlyteURLs, json_name: "flyteUrls"
end