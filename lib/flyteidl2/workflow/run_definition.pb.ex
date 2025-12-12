defmodule Flyteidl2.Workflow.ActionType do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :ACTION_TYPE_UNSPECIFIED, 0
  field :ACTION_TYPE_TASK, 1
  field :ACTION_TYPE_TRACE, 2
  field :ACTION_TYPE_CONDITION, 3
end

defmodule Flyteidl2.Workflow.RunSource do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :RUN_SOURCE_UNSPECIFIED, 0
  field :RUN_SOURCE_WEB, 1
  field :RUN_SOURCE_CLI, 2
  field :RUN_SOURCE_SCHEDULE_TRIGGER, 3
end

defmodule Flyteidl2.Workflow.ErrorInfo.Kind do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :KIND_UNSPECIFIED, 0
  field :KIND_USER, 1
  field :KIND_SYSTEM, 2
end

defmodule Flyteidl2.Workflow.Run do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action, 1, type: Flyteidl2.Workflow.Action
end

defmodule Flyteidl2.Workflow.RunDetails do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :run_spec, 1, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :action, 2, type: Flyteidl2.Workflow.ActionDetails
end

defmodule Flyteidl2.Workflow.TaskAction do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Task.TaskIdentifier
  field :spec, 2, type: Flyteidl2.Task.TaskSpec, deprecated: false
  field :cache_key, 3, type: Google.Protobuf.StringValue, json_name: "cacheKey"
  field :cluster, 4, type: :string
end

defmodule Flyteidl2.Workflow.TraceAction do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :phase, 2, type: Flyteidl2.Common.ActionPhase, enum: true
  field :start_time, 3, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 4, proto3_optional: true, type: Google.Protobuf.Timestamp, json_name: "endTime"
  field :outputs, 5, type: Flyteidl2.Task.OutputReferences
  field :spec, 6, type: Flyteidl2.Task.TraceSpec, deprecated: false
end

defmodule Flyteidl2.Workflow.ConditionAction do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :scope, 0

  field :name, 1, type: :string, deprecated: false
  field :run_id, 2, type: :string, json_name: "runId", oneof: 0, deprecated: false
  field :action_id, 3, type: :string, json_name: "actionId", oneof: 0, deprecated: false
  field :global, 4, type: :bool, oneof: 0
  field :type, 6, type: Flyteidl2.Core.LiteralType
  field :prompt, 7, type: :string
  field :description, 8, type: :string
end

defmodule Flyteidl2.Workflow.TaskActionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Task.TaskIdentifier
  field :task_type, 2, type: :string, json_name: "taskType"
  field :short_name, 3, type: :string, json_name: "shortName"
end

defmodule Flyteidl2.Workflow.TraceActionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
end

defmodule Flyteidl2.Workflow.ConditionActionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :scope, 0

  field :name, 1, type: :string
  field :run_id, 2, type: :string, json_name: "runId", oneof: 0, deprecated: false
  field :action_id, 3, type: :string, json_name: "actionId", oneof: 0, deprecated: false
  field :global, 4, type: :bool, oneof: 0
end

defmodule Flyteidl2.Workflow.ActionMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :spec, 0

  field :parent, 3, type: :string
  field :group, 5, type: :string
  field :executed_by, 6, type: Flyteidl2.Common.EnrichedIdentity, json_name: "executedBy"
  field :task, 7, type: Flyteidl2.Workflow.TaskActionMetadata, oneof: 0
  field :trace, 8, type: Flyteidl2.Workflow.TraceActionMetadata, oneof: 0
  field :condition, 9, type: Flyteidl2.Workflow.ConditionActionMetadata, oneof: 0
  field :action_type, 10, type: Flyteidl2.Workflow.ActionType, json_name: "actionType", enum: true
  field :trigger_id, 11, type: Flyteidl2.Common.TriggerIdentifier, json_name: "triggerId"
  field :environment_name, 12, type: :string, json_name: "environmentName"
  field :funtion_name, 13, type: :string, json_name: "funtionName"
  field :trigger_name, 14, type: :string, json_name: "triggerName"
  field :trigger_type, 15, type: Flyteidl2.Task.TriggerAutomationSpec, json_name: "triggerType"
  field :source, 16, type: Flyteidl2.Workflow.RunSource, enum: true
end

defmodule Flyteidl2.Workflow.ActionStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :phase, 1, type: Flyteidl2.Common.ActionPhase, enum: true
  field :start_time, 2, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 3, proto3_optional: true, type: Google.Protobuf.Timestamp, json_name: "endTime"
  field :attempts, 4, type: :uint32, deprecated: false

  field :cache_status, 5,
    type: Flyteidl2.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :duration_ms, 6, proto3_optional: true, type: :uint64, json_name: "durationMs"
end

defmodule Flyteidl2.Workflow.Action do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.ActionIdentifier
  field :metadata, 2, type: Flyteidl2.Workflow.ActionMetadata
  field :status, 3, type: Flyteidl2.Workflow.ActionStatus
end

defmodule Flyteidl2.Workflow.EnrichedAction.ChildrenPhaseCountsEntry do
  @moduledoc false

  use Protobuf, map: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :key, 1, type: :int32
  field :value, 2, type: :int32
end

defmodule Flyteidl2.Workflow.EnrichedAction do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :action, 1, type: Flyteidl2.Workflow.Action
  field :meets_filter, 2, type: :bool, json_name: "meetsFilter"

  field :children_phase_counts, 3,
    repeated: true,
    type: Flyteidl2.Workflow.EnrichedAction.ChildrenPhaseCountsEntry,
    json_name: "childrenPhaseCounts",
    map: true
end

defmodule Flyteidl2.Workflow.ErrorInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :message, 1, type: :string
  field :kind, 2, type: Flyteidl2.Workflow.ErrorInfo.Kind, enum: true
end

defmodule Flyteidl2.Workflow.AbortInfo do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :reason, 1, type: :string
  field :aborted_by, 2, type: Flyteidl2.Common.EnrichedIdentity, json_name: "abortedBy"
end

defmodule Flyteidl2.Workflow.ActionDetails do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :result, 0

  oneof :spec, 1

  field :id, 1, type: Flyteidl2.Common.ActionIdentifier
  field :metadata, 2, type: Flyteidl2.Workflow.ActionMetadata
  field :status, 3, type: Flyteidl2.Workflow.ActionStatus
  field :error_info, 4, type: Flyteidl2.Workflow.ErrorInfo, json_name: "errorInfo", oneof: 0
  field :abort_info, 5, type: Flyteidl2.Workflow.AbortInfo, json_name: "abortInfo", oneof: 0
  field :task, 6, type: Flyteidl2.Task.TaskSpec, oneof: 1
  field :trace, 8, type: Flyteidl2.Task.TraceSpec, oneof: 1
  field :attempts, 7, repeated: true, type: Flyteidl2.Workflow.ActionAttempt
end

defmodule Flyteidl2.Workflow.ActionAttempt do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :phase, 1, type: Flyteidl2.Common.ActionPhase, enum: true
  field :start_time, 2, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 3, proto3_optional: true, type: Google.Protobuf.Timestamp, json_name: "endTime"

  field :error_info, 4,
    proto3_optional: true,
    type: Flyteidl2.Workflow.ErrorInfo,
    json_name: "errorInfo"

  field :attempt, 5, type: :uint32, deprecated: false
  field :log_info, 6, repeated: true, type: Flyteidl2.Core.TaskLog, json_name: "logInfo"
  field :outputs, 7, type: Flyteidl2.Task.OutputReferences
  field :logs_available, 8, type: :bool, json_name: "logsAvailable"

  field :cache_status, 9,
    type: Flyteidl2.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :cluster_events, 10,
    repeated: true,
    type: Flyteidl2.Workflow.ClusterEvent,
    json_name: "clusterEvents"

  field :phase_transitions, 11,
    repeated: true,
    type: Flyteidl2.Workflow.PhaseTransition,
    json_name: "phaseTransitions"

  field :cluster, 12, type: :string
  field :log_context, 13, type: Flyteidl2.Core.LogContext, json_name: "logContext"
end

defmodule Flyteidl2.Workflow.ClusterEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :occurred_at, 1, type: Google.Protobuf.Timestamp, json_name: "occurredAt"
  field :message, 2, type: :string
end

defmodule Flyteidl2.Workflow.PhaseTransition do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :phase, 1, type: Flyteidl2.Common.ActionPhase, enum: true
  field :start_time, 2, type: Google.Protobuf.Timestamp, json_name: "startTime"
  field :end_time, 3, proto3_optional: true, type: Google.Protobuf.Timestamp, json_name: "endTime"
end

defmodule Flyteidl2.Workflow.ActionEvent do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.ActionIdentifier, deprecated: false
  field :attempt, 2, type: :uint32, deprecated: false
  field :phase, 3, type: Flyteidl2.Common.ActionPhase, enum: true
  field :version, 4, type: :uint32
  field :start_time, 5, type: Google.Protobuf.Timestamp, json_name: "startTime", deprecated: true
  field :updated_time, 6, type: Google.Protobuf.Timestamp, json_name: "updatedTime"

  field :end_time, 7,
    proto3_optional: true,
    type: Google.Protobuf.Timestamp,
    json_name: "endTime",
    deprecated: true

  field :error_info, 8,
    proto3_optional: true,
    type: Flyteidl2.Workflow.ErrorInfo,
    json_name: "errorInfo"

  field :log_info, 9, repeated: true, type: Flyteidl2.Core.TaskLog, json_name: "logInfo"
  field :log_context, 10, type: Flyteidl2.Core.LogContext, json_name: "logContext"
  field :cluster, 11, type: :string
  field :outputs, 12, type: Flyteidl2.Task.OutputReferences

  field :cache_status, 13,
    type: Flyteidl2.Core.CatalogCacheStatus,
    json_name: "cacheStatus",
    enum: true

  field :cluster_events, 14,
    repeated: true,
    type: Flyteidl2.Workflow.ClusterEvent,
    json_name: "clusterEvents"

  field :reported_time, 15, type: Google.Protobuf.Timestamp, json_name: "reportedTime"
end

defmodule Flyteidl2.Workflow.ActionSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :spec, 0

  field :action_id, 1,
    type: Flyteidl2.Common.ActionIdentifier,
    json_name: "actionId",
    deprecated: false

  field :parent_action_name, 2,
    proto3_optional: true,
    type: :string,
    json_name: "parentActionName"

  field :run_spec, 3, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :input_uri, 4, type: :string, json_name: "inputUri", deprecated: false
  field :run_output_base, 5, type: :string, json_name: "runOutputBase", deprecated: false
  field :task, 6, type: Flyteidl2.Workflow.TaskAction, oneof: 0
  field :condition, 7, type: Flyteidl2.Workflow.ConditionAction, oneof: 0
  field :trace, 10, type: Flyteidl2.Workflow.TraceAction, oneof: 0
  field :group, 8, type: :string
end

defmodule Flyteidl2.Workflow.TaskGroup do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_name, 1, type: :string, json_name: "taskName"
  field :environment_name, 2, type: :string, json_name: "environmentName"
  field :total_runs, 3, type: :int64, json_name: "totalRuns"
  field :latest_run_time, 4, type: Google.Protobuf.Timestamp, json_name: "latestRunTime"

  field :recent_statuses, 5,
    repeated: true,
    type: Flyteidl2.Common.ActionPhase,
    json_name: "recentStatuses",
    enum: true

  field :average_failure_rate, 6, type: :double, json_name: "averageFailureRate"
  field :average_duration, 7, type: Google.Protobuf.Duration, json_name: "averageDuration"
  field :latest_finished_time, 8, type: Google.Protobuf.Timestamp, json_name: "latestFinishedTime"

  field :created_by, 9,
    repeated: true,
    type: Flyteidl2.Common.EnrichedIdentity,
    json_name: "createdBy"

  field :should_delete, 10, type: :bool, json_name: "shouldDelete"
  field :short_name, 11, type: :string, json_name: "shortName"
end
