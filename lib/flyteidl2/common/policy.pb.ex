defmodule Flyteidl2.Common.Policy do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :id, 1, type: Flyteidl2.Common.PolicyIdentifier, deprecated: false
  field :bindings, 2, repeated: true, type: Flyteidl2.Common.PolicyBinding
  field :description, 3, type: :string
end

defmodule Flyteidl2.Common.PolicyBinding do
  @moduledoc false

  use Protobuf, protoc_gen_elixir_version: "0.15.0", syntax: :proto3

  field :role_id, 1, type: Flyteidl2.Common.RoleIdentifier, json_name: "roleId", deprecated: false
  field :resource, 2, type: Flyteidl2.Common.Resource, deprecated: false
end
