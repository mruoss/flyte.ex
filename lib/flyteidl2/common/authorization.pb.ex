defmodule Flyteidl2.Common.Action do
  @moduledoc false

  use Protobuf, enum: true, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :ACTION_NONE, 0
  field :ACTION_CREATE, 1
  field :ACTION_READ, 2
  field :ACTION_UPDATE, 3
  field :ACTION_DELETE, 4
  field :ACTION_VIEW_FLYTE_INVENTORY, 5
  field :ACTION_VIEW_FLYTE_EXECUTIONS, 6
  field :ACTION_REGISTER_FLYTE_INVENTORY, 7
  field :ACTION_CREATE_FLYTE_EXECUTIONS, 8
  field :ACTION_ADMINISTER_PROJECT, 9
  field :ACTION_MANAGE_PERMISSIONS, 10
  field :ACTION_ADMINISTER_ACCOUNT, 11
  field :ACTION_MANAGE_CLUSTER, 12
  field :ACTION_EDIT_EXECUTION_RELATED_ATTRIBUTES, 13
  field :ACTION_EDIT_CLUSTER_RELATED_ATTRIBUTES, 14
  field :ACTION_EDIT_UNUSED_ATTRIBUTES, 15
  field :ACTION_SUPPORT_SYSTEM_LOGS, 16
end

defmodule Flyteidl2.Common.Organization do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
end

defmodule Flyteidl2.Common.Domain do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string
  field :organization, 2, type: Flyteidl2.Common.Organization, deprecated: false
end

defmodule Flyteidl2.Common.Project do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :domain, 2, type: Flyteidl2.Common.Domain, deprecated: false
end

defmodule Flyteidl2.Common.Workflow do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :project, 2, type: Flyteidl2.Common.Project, deprecated: false
end

defmodule Flyteidl2.Common.LaunchPlan do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :name, 1, type: :string, deprecated: false
  field :project, 2, type: Flyteidl2.Common.Project, deprecated: false
end

defmodule Flyteidl2.Common.Resource do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  oneof :resource, 0

  field :organization, 1, type: Flyteidl2.Common.Organization, oneof: 0
  field :domain, 2, type: Flyteidl2.Common.Domain, oneof: 0
  field :project, 3, type: Flyteidl2.Common.Project, oneof: 0
  field :workflow, 4, type: Flyteidl2.Common.Workflow, oneof: 0
  field :launch_plan, 5, type: Flyteidl2.Common.LaunchPlan, json_name: "launchPlan", oneof: 0
  field :cluster, 6, type: Flyteidl2.Common.ClusterIdentifier, oneof: 0
end

defmodule Flyteidl2.Common.Permission do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :resource, 1, type: Flyteidl2.Common.Resource
  field :actions, 2, repeated: true, type: Flyteidl2.Common.Action, enum: true
end
