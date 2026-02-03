defmodule Flyteidl2.Event.CloudEventWorkflowExecution.LabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventWorkflowExecution.LabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Event.CloudEventWorkflowExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventWorkflowExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_event, 1, type: Flyteidl2.Event.WorkflowExecutionEvent, json_name: "rawEvent"
  field :output_interface, 2, type: Flyteidl2.Core.TypedInterface, json_name: "outputInterface"

  field :artifact_ids, 3,
    repeated: true,
    type: Flyteidl2.Core.ArtifactID,
    json_name: "artifactIds"

  field :reference_execution, 4,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "referenceExecution"

  field :principal, 5, type: :string
  field :launch_plan_id, 6, type: Flyteidl2.Core.Identifier, json_name: "launchPlanId"

  field :labels, 7,
    repeated: true,
    type: Flyteidl2.Event.CloudEventWorkflowExecution.LabelsEntry,
    map: true
end

defmodule Flyteidl2.Event.CloudEventNodeExecution.LabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventNodeExecution.LabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Event.CloudEventNodeExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventNodeExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_event, 1, type: Flyteidl2.Event.NodeExecutionEvent, json_name: "rawEvent"
  field :task_exec_id, 2, type: Flyteidl2.Core.TaskExecutionIdentifier, json_name: "taskExecId"
  field :output_interface, 3, type: Flyteidl2.Core.TypedInterface, json_name: "outputInterface"

  field :artifact_ids, 4,
    repeated: true,
    type: Flyteidl2.Core.ArtifactID,
    json_name: "artifactIds"

  field :principal, 5, type: :string
  field :launch_plan_id, 6, type: Flyteidl2.Core.Identifier, json_name: "launchPlanId"

  field :labels, 7,
    repeated: true,
    type: Flyteidl2.Event.CloudEventNodeExecution.LabelsEntry,
    map: true
end

defmodule Flyteidl2.Event.CloudEventTaskExecution.LabelsEntry do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventTaskExecution.LabelsEntry",
    map: true,
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: :string
end

defmodule Flyteidl2.Event.CloudEventTaskExecution do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventTaskExecution",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :raw_event, 1, type: Flyteidl2.Event.TaskExecutionEvent, json_name: "rawEvent"

  field :labels, 2,
    repeated: true,
    type: Flyteidl2.Event.CloudEventTaskExecution.LabelsEntry,
    map: true
end

defmodule Flyteidl2.Event.CloudEventExecutionStart do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.event.CloudEventExecutionStart",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :execution_id, 1,
    type: Flyteidl2.Core.WorkflowExecutionIdentifier,
    json_name: "executionId"

  field :launch_plan_id, 2, type: Flyteidl2.Core.Identifier, json_name: "launchPlanId"
  field :workflow_id, 3, type: Flyteidl2.Core.Identifier, json_name: "workflowId"

  field :artifact_ids, 4,
    repeated: true,
    type: Flyteidl2.Core.ArtifactID,
    json_name: "artifactIds"

  field :artifact_trackers, 5, repeated: true, type: :string, json_name: "artifactTrackers"
  field :principal, 6, type: :string
end
