defmodule Flyteidl2.Task.TaskName do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
end

defmodule Flyteidl2.Task.TaskIdentifier do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :org, 1, type: :string, deprecated: false
  field :project, 2, type: :string, deprecated: false
  field :domain, 3, type: :string, deprecated: false
  field :name, 4, type: :string, deprecated: false
  field :version, 5, type: :string, deprecated: false
end

defmodule Flyteidl2.Task.TaskTriggersSummary.TriggerDetails do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :active, 2, type: :bool

  field :automation_spec, 3,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Task.TaskTriggersSummary.TriggerStats do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :total, 1, type: :uint32
  field :active, 2, type: :uint32
end

defmodule Flyteidl2.Task.TaskTriggersSummary do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :summary, 0

  field :details, 3, type: Flyteidl2.Task.TaskTriggersSummary.TriggerDetails, oneof: 0
  field :stats, 2, type: Flyteidl2.Task.TaskTriggersSummary.TriggerStats, oneof: 0
end

defmodule Flyteidl2.Task.TaskMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

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
end

defmodule Flyteidl2.Task.Task do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :metadata, 2, type: Flyteidl2.Task.TaskMetadata, deprecated: false
end

defmodule Flyteidl2.Task.TaskSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

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
end

defmodule Flyteidl2.Task.TraceSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :interface, 1, type: Flyteidl2.Core.TypedInterface
end

defmodule Flyteidl2.Task.TaskDetails do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :task_id, 1, type: Flyteidl2.Task.TaskIdentifier, json_name: "taskId", deprecated: false
  field :metadata, 2, type: Flyteidl2.Task.TaskMetadata, deprecated: false
  field :spec, 3, type: Flyteidl2.Task.TaskSpec, deprecated: false
end

defmodule Flyteidl2.Task.TaskTrigger do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :spec, 2, type: Flyteidl2.Task.TaskTriggerSpec, deprecated: false

  field :automation_spec, 3,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Task.TaskTriggerSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :active, 1, type: :bool
  field :inputs, 2, type: Flyteidl2.Task.Inputs
  field :run_spec, 3, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
end
