defmodule Flyteidl2.Common.RoleType do
  @moduledoc false

  use Protobuf,
    enum: true,
    full_name: "flyteidl2.common.RoleType",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :ROLE_TYPE_NONE, 0
  field :ROLE_TYPE_ADMIN, 1
  field :ROLE_TYPE_CONTRIBUTOR, 2
  field :ROLE_TYPE_VIEWER, 3
  field :ROLE_TYPE_CUSTOM, 4
  field :ROLE_TYPE_CLUSTER_MANAGER, 5
  field :ROLE_TYPE_FLYTE_PROJECT_ADMIN, 6
  field :ROLE_TYPE_SERVERLESS_VIEWER, 7
  field :ROLE_TYPE_SERVERLESS_CONTRIBUTOR, 8
  field :ROLE_TYPE_SUPPORT, 9
end

defmodule Flyteidl2.Common.Role do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.Role",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.RoleIdentifier, deprecated: false
  field :permissions, 2, repeated: true, type: Flyteidl2.Common.Permission, deprecated: true
  field :role_spec, 3, type: Flyteidl2.Common.RoleSpec, json_name: "roleSpec"
  field :role_type, 4, type: Flyteidl2.Common.RoleType, json_name: "roleType", enum: true
  field :actions, 5, repeated: true, type: Flyteidl2.Common.Action, enum: true
end

defmodule Flyteidl2.Common.RoleSpec do
  @moduledoc false

  use Protobuf,
    full_name: "flyteidl2.common.RoleSpec",
    protoc_gen_elixir_version: "0.16.0",
    syntax: :proto3

  field :description, 1, type: :string
end
