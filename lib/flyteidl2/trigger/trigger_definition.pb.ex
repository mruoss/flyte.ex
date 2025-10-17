defmodule Flyteidl2.Trigger.TriggerRevisionAction do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :TRIGGER_REVISION_ACTION_UNSPECIFIED, 0
  field :TRIGGER_REVISION_ACTION_DEPLOY, 1
  field :TRIGGER_REVISION_ACTION_ACTIVATE, 2
  field :TRIGGER_REVISION_ACTION_DEACTIVATE, 3
  field :TRIGGER_REVISION_ACTION_DELETE, 4
end

defmodule Flyteidl2.Trigger.TriggerMetadata do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :deployed_by, 1,
    type: Flyteidl2.Common.EnrichedIdentity,
    json_name: "deployedBy",
    deprecated: false

  field :updated_by, 2,
    type: Flyteidl2.Common.EnrichedIdentity,
    json_name: "updatedBy",
    deprecated: false
end

defmodule Flyteidl2.Trigger.TriggerSpec do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :inputs, 2, type: Flyteidl2.Task.Inputs
  field :run_spec, 3, type: Flyteidl2.Task.RunSpec, json_name: "runSpec"
  field :active, 4, type: :bool
  field :task_version, 5, type: :string, json_name: "taskVersion", deprecated: false
end

defmodule Flyteidl2.Trigger.TriggerStatus do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :deployed_at, 1,
    type: Google.Protobuf.Timestamp,
    json_name: "deployedAt",
    deprecated: false

  field :updated_at, 2, type: Google.Protobuf.Timestamp, json_name: "updatedAt", deprecated: false
  field :triggered_at, 3, type: Google.Protobuf.Timestamp, json_name: "triggeredAt"
  field :deleted_at, 4, type: Google.Protobuf.Timestamp, json_name: "deletedAt"
end

defmodule Flyteidl2.Trigger.TriggerRevision do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.TriggerIdentifier
  field :metadata, 2, type: Flyteidl2.Trigger.TriggerMetadata
  field :status, 3, type: Flyteidl2.Trigger.TriggerStatus
  field :action, 4, type: Flyteidl2.Trigger.TriggerRevisionAction, enum: true
end

defmodule Flyteidl2.Trigger.TriggerDetails do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.TriggerIdentifier, deprecated: false
  field :metadata, 2, type: Flyteidl2.Trigger.TriggerMetadata
  field :spec, 3, type: Flyteidl2.Trigger.TriggerSpec, deprecated: false
  field :status, 4, type: Flyteidl2.Trigger.TriggerStatus

  field :automation_spec, 5,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end

defmodule Flyteidl2.Trigger.Trigger do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.TriggerIdentifier
  field :metadata, 2, type: Flyteidl2.Trigger.TriggerMetadata
  field :status, 3, type: Flyteidl2.Trigger.TriggerStatus
  field :active, 5, type: :bool

  field :automation_spec, 6,
    type: Flyteidl2.Task.TriggerAutomationSpec,
    json_name: "automationSpec"
end
