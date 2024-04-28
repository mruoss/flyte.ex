defmodule Flyteidl.Admin.TaskExecutionGetRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.TaskExecutionIdentifier
end

defmodule Flyteidl.Admin.TaskExecutionListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :node_execution_id, 1,
    type: Flyteidl.Core.NodeExecutionIdentifier,
    json_name: "nodeExecutionId"

  field :limit, 2, type: :uint32
  field :token, 3, type: :string
  field :filters, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end

defmodule Flyteidl.Admin.TaskExecution do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.TaskExecutionIdentifier
  field :input_uri, 2, type: :string, json_name: "inputUri"
  field :closure, 3, type: Flyteidl.Admin.TaskExecutionClosure
  field :is_parent, 4, type: :bool, json_name: "isParent"
end

defmodule Flyteidl.Admin.TaskExecutionList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_executions, 1,
    repeated: true,
    type: Flyteidl.Admin.TaskExecution,
    json_name: "taskExecutions"

  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.TaskExecutionClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :output_result, 0

  field :output_uri, 1, type: :string, json_name: "outputUri", oneof: 0, deprecated: true
  field :error, 2, type: Flyteidl.Core.ExecutionError, oneof: 0

  field :output_data, 12,
    type: Flyteidl.Core.LiteralMap,
    json_name: "outputData",
    oneof: 0,
    deprecated: true

  field :phase, 3, type: Flyteidl.Core.TaskExecution.Phase, enum: true
  field :logs, 4, repeated: true, type: Flyteidl.Core.TaskLog
  field :started_at, 5, type: Google.Protobuf.Timestamp, json_name: "startedAt"
  field :duration, 6, type: Google.Protobuf.Duration
  field :created_at, 7, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :updated_at, 8, type: Google.Protobuf.Timestamp, json_name: "updatedAt"
  field :custom_info, 9, type: Google.Protobuf.Struct, json_name: "customInfo"
  field :reason, 10, type: :string
  field :task_type, 11, type: :string, json_name: "taskType"
  field :metadata, 16, type: Flyteidl.Event.TaskExecutionMetadata
  field :event_version, 17, type: :int32, json_name: "eventVersion"
  field :reasons, 18, repeated: true, type: Flyteidl.Admin.Reason
end

defmodule Flyteidl.Admin.Reason do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :occurred_at, 1, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :message, 2, type: :string
end

defmodule Flyteidl.Admin.TaskExecutionGetDataRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.TaskExecutionIdentifier
end

defmodule Flyteidl.Admin.TaskExecutionGetDataResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :inputs, 1, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :outputs, 2, type: Flyteidl.Admin.UrlBlob, deprecated: true
  field :full_inputs, 3, type: Flyteidl.Core.LiteralMap, json_name: "fullInputs"
  field :full_outputs, 4, type: Flyteidl.Core.LiteralMap, json_name: "fullOutputs"
  field :flyte_urls, 5, type: Flyteidl.Admin.FlyteURLs, json_name: "flyteUrls"
end