defmodule Flyteidl2.Task.TaskName do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskName",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.Task.TaskIdentifier do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskIdentifier",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
  field :version, 5, type: :string, deprecated: false
end

defmodule Flyteidl2.Task.TaskTriggersSummary.TriggerDetails do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskTriggersSummary.TriggerDetails",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string
  field :active, 2, type: :bool

  field :automation_spec, 3,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Task.TaskTriggersSummary.TriggerStats do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskTriggersSummary.TriggerStats",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :total, 1, type: :uint32
  field :active, 2, type: :uint32
end

defmodule Flyteidl2.Task.TaskTriggersSummary do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskTriggersSummary",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  oneof :summary, 0

  field :details, 3, type: Flyteidl2.Task.TaskTriggersSummary.TriggerDetails, oneof: 0
  field :stats, 2, type: Flyteidl2.Task.TaskTriggersSummary.TriggerStats, oneof: 0
end

defmodule Flyteidl2.Task.LatestRunSummary do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.LatestRunSummary",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :run_id, 1, type: Flyteidl2.Common.RunIdentifier, json_name: "runId"
  field :run_time, 2, type: Google.Protobuf.Timestamp, json_name: "runTime"
  field :phase, 3, type: Flyteidl2.Common.ActionPhase, enum: true
  field :root_task_name, 4, type: :string, json_name: "rootTaskName"
end

defmodule Flyteidl2.Task.TaskMetadata do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskMetadata",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :deployed_by, 1,
    type: Flyteidl2.Common.EnrichedIdentity,
    json_name: "deployedBy",
    deprecated: false

  field :short_name, 2, type: :string, json_name: "shortName"

  field :deployed_at, 3,
    type: Google.Protobuf.Timestamp,
    json_name: "deployedAt",
    deprecated: false

  field :environment_name, 4, type: :string, json_name: "environmentName"

  field :triggers_summary, 5,
    type: Flyteidl2.Task.TaskTriggersSummary,
    json_name: "triggersSummary"

  field :short_description, 6, type: :string, json_name: "shortDescription"
end

defmodule Flyteidl2.Task.TaskSummary do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskSummary",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :latest_run, 1,
    proto3_optional: true,
    type: Flyteidl2.Task.LatestRunSummary,
    json_name: "latestRun"
end

defmodule Flyteidl2.Task.Task do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.Task",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :metadata, 2, type: Flyteidl2.Task.TaskMetadata, deprecated: false

  field :task_summary, 3,
    proto3_optional: true,
    type: Flyteidl2.Task.TaskSummary,
    json_name: "taskSummary"
end

defmodule Flyteidl2.Task.SourceCode do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.SourceCode",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :link, 1, type: :string
end

defmodule Flyteidl2.Task.DocumentationEntity do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.DocumentationEntity",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :short_description, 1, type: :string, json_name: "shortDescription", deprecated: false
  field :long_description, 2, type: :string, json_name: "longDescription", deprecated: false
  field :source_code, 3, type: Flyteidl2.Task.SourceCode, json_name: "sourceCode"
end

defmodule Flyteidl2.Task.TaskSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_template, 1,
    type: Flyteidl2.Core.TaskTemplate,
    json_name: "taskTemplate",
    deprecated: false

  field :default_inputs, 2,
    repeated: true,
    type: Flyteidl2.Task.NamedParameter,
    json_name: "defaultInputs"

  field :short_name, 3, type: :string, json_name: "shortName", deprecated: false
  field :environment, 4, type: Flyteidl2.Task.Environment
  field :documentation, 5, type: Flyteidl2.Task.DocumentationEntity
end

defmodule Flyteidl2.Task.TraceSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TraceSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :interface, 1, type: Flyteidl2.Core.TypedInterface
end

defmodule Flyteidl2.Task.TaskDetails do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskDetails",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :metadata, 2, type: Flyteidl2.Task.TaskMetadata, deprecated: false
  field :spec, 3, type: Flyteidl2.Task.TaskSpec, deprecated: false
end

defmodule Flyteidl2.Task.TaskTrigger do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskTrigger",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :spec, 2, type: Flyteidl2.Task.TaskTriggerSpec, deprecated: false

  field :automation_spec, 3,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Task.TaskTriggerSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.task.TaskTriggerSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :active, 1, type: :bool
  field :inputs, 2, type: Flyteidl2.Task.Inputs
  field :run_spec, 3, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :description, 4, type: :string
end
