defmodule Flyteidl.Admin.LaunchPlanState do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :INACTIVE, 0
  field :ACTIVE, 1
end

defmodule Flyteidl.Admin.LaunchPlanCreateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :spec, 2, type: Flyteidl.Admin.LaunchPlanSpec
end

defmodule Flyteidl.Admin.LaunchPlanCreateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.LaunchPlan do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :spec, 2, type: Flyteidl.Admin.LaunchPlanSpec
  field :closure, 3, type: Flyteidl.Admin.LaunchPlanClosure
end

defmodule Flyteidl.Admin.LaunchPlanList do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :launch_plans, 1,
    repeated: true,
    type: Flyteidl.Admin.LaunchPlan,
    json_name: "launchPlans"

  field :token, 2, type: :string
end

defmodule Flyteidl.Admin.Auth do
  @moduledoc false

  use Protobuf, deprecated: true, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :assumable_iam_role, 1, type: :string, json_name: "assumableIamRole"
  field :kubernetes_service_account, 2, type: :string, json_name: "kubernetesServiceAccount"
end

defmodule Flyteidl.Admin.LaunchPlanSpec do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :workflow_id, 1, type: Flyteidl.Core.Identifier, json_name: "workflowId"
  field :entity_metadata, 2, type: Flyteidl.Admin.LaunchPlanMetadata, json_name: "entityMetadata"
  field :default_inputs, 3, type: Flyteidl.Core.ParameterMap, json_name: "defaultInputs"
  field :fixed_inputs, 4, type: Flyteidl.Core.LiteralMap, json_name: "fixedInputs"
  field :role, 5, type: :string, deprecated: true
  field :labels, 6, type: Flyteidl.Admin.Labels
  field :annotations, 7, type: Flyteidl.Admin.Annotations
  field :auth, 8, type: Flyteidl.Admin.Auth, deprecated: true
  field :auth_role, 9, type: Flyteidl.Admin.AuthRole, json_name: "authRole", deprecated: true
  field :security_context, 10, type: Flyteidl.Core.SecurityContext, json_name: "securityContext"

  field :quality_of_service, 16,
    type: Flyteidl.Core.QualityOfService,
    json_name: "qualityOfService"

  field :raw_output_data_config, 17,
    type: Flyteidl.Admin.RawOutputDataConfig,
    json_name: "rawOutputDataConfig"

  field :max_parallelism, 18, type: :int32, json_name: "maxParallelism"
  field :interruptible, 19, type: Google.Protobuf.BoolValue
  field :overwrite_cache, 20, type: :bool, json_name: "overwriteCache"
  field :envs, 21, type: Flyteidl.Admin.Envs
end

defmodule Flyteidl.Admin.LaunchPlanClosure do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :state, 1, type: Flyteidl.Admin.LaunchPlanState, enum: true
  field :expected_inputs, 2, type: Flyteidl.Core.ParameterMap, json_name: "expectedInputs"
  field :expected_outputs, 3, type: Flyteidl.Core.VariableMap, json_name: "expectedOutputs"
  field :created_at, 4, type: Google.Protobuf.Timestamp, json_name: "createdAt"
  field :updated_at, 5, type: Google.Protobuf.Timestamp, json_name: "updatedAt"
end

defmodule Flyteidl.Admin.LaunchPlanMetadata do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :schedule, 1, type: Flyteidl.Admin.Schedule
  field :notifications, 2, repeated: true, type: Flyteidl.Admin.Notification
end

defmodule Flyteidl.Admin.LaunchPlanUpdateRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Core.Identifier
  field :state, 2, type: Flyteidl.Admin.LaunchPlanState, enum: true
end

defmodule Flyteidl.Admin.LaunchPlanUpdateResponse do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"
end

defmodule Flyteidl.Admin.ActiveLaunchPlanRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :id, 1, type: Flyteidl.Admin.NamedEntityIdentifier
end

defmodule Flyteidl.Admin.ActiveLaunchPlanListRequest do
  @moduledoc false

  use Protobuf, syntax: :proto3, protoc_gen_elixir_version: "0.12.0"

  field :project, 1, type: :string
  field :domain, 2, type: :string
  field :limit, 3, type: :uint32
  field :token, 4, type: :string
  field :sort_by, 5, type: Flyteidl.Admin.Sort, json_name: "sortBy"
end