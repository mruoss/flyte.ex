defmodule Flyteidl.Admin.MatchableResource do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :TASK_RESOURCE, 0
  field :CLUSTER_RESOURCE, 1
  field :EXECUTION_QUEUE, 2
  field :EXECUTION_CLUSTER_LABEL, 3
  field :QUALITY_OF_SERVICE_SPECIFICATION, 4
  field :PLUGIN_OVERRIDE, 5
  field :WORKFLOW_EXECUTION_CONFIG, 6
  field :CLUSTER_ASSIGNMENT, 7
end

defmodule Flyteidl.Admin.PluginOverride.MissingPluginBehavior do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :FAIL, 0
  field :USE_DEFAULT, 1
end

defmodule Flyteidl.Admin.TaskResourceSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :cpu, 1, type: :string
  field :gpu, 2, type: :string
  field :memory, 3, type: :string
  field :storage, 4, type: :string
  field :ephemeral_storage, 5, type: :string, json_name: "ephemeralStorage"
end

defmodule Flyteidl.Admin.TaskResourceAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :defaults, 1, type: Flyteidl.Admin.TaskResourceSpec
  field :limits, 2, type: Flyteidl.Admin.TaskResourceSpec
end

defmodule Flyteidl.Admin.ClusterResourceAttributes.AttributesEntry do
  @moduledoc false

  use Protobuf, map: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl.Admin.ClusterResourceAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1,
    repeated: true,
    type: Flyteidl.Admin.ClusterResourceAttributes.AttributesEntry,
    map: true
end

defmodule Flyteidl.Admin.ExecutionQueueAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :tags, 1, repeated: true, type: :string
end

defmodule Flyteidl.Admin.ExecutionClusterLabel do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :value, 1, type: :string
end

defmodule Flyteidl.Admin.PluginOverride do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :task_type, 1, type: :string, json_name: "taskType"
  field :plugin_id, 2, repeated: true, type: :string, json_name: "pluginId"

  field :missing_plugin_behavior, 4,
    type: Flyteidl.Admin.PluginOverride.MissingPluginBehavior,
    json_name: "missingPluginBehavior",
    enum: true
end

defmodule Flyteidl.Admin.PluginOverrides do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :overrides, 1, repeated: true, type: Flyteidl.Admin.PluginOverride
end

defmodule Flyteidl.Admin.WorkflowExecutionConfig do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :max_parallelism, 1, type: :int32, json_name: "maxParallelism"
  field :security_context, 2, type: Flyteidl.Core.SecurityContext, json_name: "securityContext"

  field :raw_output_data_config, 3,
    type: Flyteidl.Admin.RawOutputDataConfig,
    json_name: "rawOutputDataConfig"

  field :labels, 4, type: Flyteidl.Admin.Labels
  field :annotations, 5, type: Flyteidl.Admin.Annotations
  field :interruptible, 6, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 7, type: :bool, json_name: "overwriteCache"
  field :envs, 8, type: Flyteidl.Admin.Envs
end

defmodule Flyteidl.Admin.MatchingAttributes do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  oneof :target, 0

  field :task_resource_attributes, 1,
    type: Flyteidl.Admin.TaskResourceAttributes,
    json_name: "taskResourceAttributes",
    oneof: 0

  field :cluster_resource_attributes, 2,
    type: Flyteidl.Admin.ClusterResourceAttributes,
    json_name: "clusterResourceAttributes",
    oneof: 0

  field :execution_queue_attributes, 3,
    type: Flyteidl.Admin.ExecutionQueueAttributes,
    json_name: "executionQueueAttributes",
    oneof: 0

  field :execution_cluster_label, 4,
    type: Flyteidl.Admin.ExecutionClusterLabel,
    json_name: "executionClusterLabel",
    oneof: 0

  field :quality_of_service, 5,
    type: Flyteidl.Core.QualityOfService,
    json_name: "qualityOfService",
    oneof: 0

  field :plugin_overrides, 6,
    type: Flyteidl.Admin.PluginOverrides,
    json_name: "pluginOverrides",
    oneof: 0

  field :workflow_execution_config, 7,
    type: Flyteidl.Admin.WorkflowExecutionConfig,
    json_name: "workflowExecutionConfig",
    oneof: 0

  field :cluster_assignment, 8,
    type: Flyteidl.Admin.ClusterAssignment,
    json_name: "clusterAssignment",
    oneof: 0
end

defmodule Flyteidl.Admin.MatchableAttributesConfiguration do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :attributes, 1, type: Flyteidl.Admin.MatchingAttributes
  field :domain, 2, type: :string
  field :project, 3, type: :string
  field :workflow, 4, type: :string
  field :launch_plan, 5, type: :string, json_name: "launchPlan"
end

defmodule Flyteidl.Admin.ListMatchableAttributesRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :resource_type, 1,
    type: Flyteidl.Admin.MatchableResource,
    json_name: "resourceType",
    enum: true
end

defmodule Flyteidl.Admin.ListMatchableAttributesResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :configurations, 1, repeated: true, type: Flyteidl.Admin.MatchableAttributesConfiguration
end